import sys
from typing import List, Dict, Tuple

def parse_decomposition(decomp_file: str) -> List[Dict]:
    """Parse the decomposition file and return list of schemas."""
    schemas = []
    
    with open(decomp_file, 'r') as f:
        lines = [line.strip() for line in f if line.strip()]
    
    # Process in groups of 3 lines
    for i in range(0, len(lines), 3):
        if i + 2 >= len(lines):
            break
            
        table_name = lines[i]
        attributes = [
            attr.strip() 
            for attr in lines[i + 1].split(',')
            if attr.strip()  # ignore empty from trailing comma
        ]
        fds_str = lines[i + 2]
        
        # Parse FDs (space-separated)
        fds = []
        if fds_str.strip():
            for fd_str in fds_str.split():
                if '->' in fd_str:
                    lhs, rhs = fd_str.split('->')
                    lhs_attrs = [a.strip() for a in lhs.split(',') if a.strip()]
                    rhs_attrs = [a.strip() for a in rhs.split(',') if a.strip()]
                    fds.append((lhs_attrs, rhs_attrs))
        
        schemas.append({
            'table_name': table_name,
            'attributes': attributes,
            'fds': fds
        })
    
    return schemas

def is_key_dependency(lhs: List[str], rhs: List[str], all_attrs: List[str]) -> bool:
    """Check if an FD is a key dependency (LHS ∪ RHS = all attributes)."""
    fd_attrs = set(lhs + rhs)
    return fd_attrs == set(all_attrs)

def generate_fd_trigger(table_name: str, lhs: List[str], rhs: List[str], 
                        trigger_num: int) -> str:
    """Generate a trigger to enforce an FD."""
    trigger_name = f"enforce_{table_name}_fd{trigger_num}"
    
    # Build WHERE clause for matching LHS
    lhs_conditions = " AND ".join(f"{attr} = NEW.{attr}" for attr in lhs)
    
    # Build check for conflicting RHS
    rhs_checks = " OR ".join(f"existing_{attr} != NEW.{attr}" for attr in rhs)
    
    # Declare variables for RHS values
    declares = "\n    ".join(f"DECLARE existing_{attr} VARCHAR(255);" for attr in rhs)
    
    # Select existing values
    selects = ", ".join(rhs)
    into_clause = ", ".join(f"existing_{attr}" for attr in rhs)
    
    trigger = f"""DELIMITER $$
CREATE TRIGGER {trigger_name}_insert
BEFORE INSERT ON {table_name}
FOR EACH ROW
BEGIN
    {declares}
    
    SELECT {selects} INTO {into_clause}
    FROM {table_name}
    WHERE {lhs_conditions}
    LIMIT 1;
    
    IF {into_clause.split(',')[0]} IS NOT NULL AND ({rhs_checks}) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: {",".join(lhs)} -> {",".join(rhs)}';
    END IF;
END$$

CREATE TRIGGER {trigger_name}_update
BEFORE UPDATE ON {table_name}
FOR EACH ROW
BEGIN
    {declares}
    
    SELECT {selects} INTO {into_clause}
    FROM {table_name}
    WHERE {lhs_conditions}
    LIMIT 1;
    
    IF {into_clause.split(',')[0]} IS NOT NULL AND ({rhs_checks}) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: {",".join(lhs)} -> {",".join(rhs)}';
    END IF;
END$$
DELIMITER ;
"""
    return trigger

def generate_create_tables(decomp_file: str, output_file: str = None):
    """Generate CREATE TABLE statements with constraints."""
    
    schemas = parse_decomposition(decomp_file)
    output_lines = []
    
    for schema in schemas:
        table_name = schema['table_name']
        attributes = schema['attributes']
        fds = schema['fds']
        
        # Start CREATE TABLE statement
        output_lines.append(f"CREATE TABLE {table_name} (")
        
        # Column definitions
        col_defs = [f"    {attr} VARCHAR(255)" for attr in attributes]
        output_lines.append(",\n".join(col_defs))
        
        # Process FDs to find key dependencies (for UNIQUE constraints)
        unique_constraints = []
        trigger_fds = []
        
        for lhs, rhs in fds:
            if is_key_dependency(lhs, rhs, attributes):
                # This is a key dependency - use UNIQUE constraint
                unique_key = sorted(set(lhs))  # LHS is the key
                unique_constraints.append(unique_key)
            else:
                # This is a non-key FD - will need a trigger
                trigger_fds.append((lhs, rhs))
        
        # Add UNIQUE constraints to CREATE TABLE
        if unique_constraints:
            # Remove duplicates while preserving order
            seen = set()
            unique_keys = []
            for key in unique_constraints:
                key_tuple = tuple(key)
                if key_tuple not in seen:
                    seen.add(key_tuple)
                    unique_keys.append(key)
            
            for i, key in enumerate(unique_keys):
                output_lines.append(f",\n    UNIQUE KEY unique_{table_name}_{i} ({', '.join(key)})")
        
        output_lines.append(");\n")
        
        # Generate triggers for non-key FDs
        for trigger_num, (lhs, rhs) in enumerate(trigger_fds):
            trigger = generate_fd_trigger(table_name, lhs, rhs, trigger_num)
            output_lines.append(trigger)
        
        output_lines.append("")  # Blank line between tables
    
    # Output results
    result = "\n".join(output_lines)
    
    if output_file:
        with open(output_file, 'w') as f:
            f.write(result)
        print(f"CREATE TABLE statements written to {output_file}")
    else:
        print(result)
    
    return result

def main():
    if len(sys.argv) < 2:
        print("Usage: python generate_tables.py <decomposition_file> [output_file]")
        print("Example: python generate_tables.py decomposition.txt create_tables.sql")
        sys.exit(1)
    
    decomp_file = sys.argv[1]
    output_file = sys.argv[2] if len(sys.argv) > 2 else None
    
    try:
        generate_create_tables(decomp_file, output_file)
    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
        import traceback
        traceback.print_exc()
        sys.exit(1)

if __name__ == "__main__":
    main()