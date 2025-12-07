import csv
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
        
        schemas.append({
            'table_name': table_name,
            'attributes': attributes
        })
    
    return schemas

def project_record(record: Dict[str, str], attributes: List[str]) -> Tuple:
    """Project a record onto a subset of attributes."""
    return tuple(record.get(attr, '') for attr in attributes)

def generate_insert_statements(csv_file: str, decomp_file: str, n_lines: int, 
                               output_file: str = None):
    """Generate SQL INSERT statements for decomposed tables."""
    
    # Parse decomposition
    schemas = parse_decomposition(decomp_file)
    
    # Read CSV file
    with open(csv_file, 'r') as f:
        reader = csv.DictReader(f)
        records = []
        for i, row in enumerate(reader):
            if i >= n_lines:
                break
            records.append(row)
    
    # Generate SQL for each schema
    output_lines = []
    
    for schema in schemas:
        table_name = schema['table_name']
        attributes = schema['attributes']
        
        # Collect unique projected tuples
        projected_tuples = set()
        for record in records:
            projected = project_record(record, attributes)
            projected_tuples.add(projected)
        
        # Generate INSERT statements
        output_lines.append(f"-- Inserts for {table_name}")
        for projected in sorted(projected_tuples):
            # Escape single quotes in values
            escaped_values = [val.replace("'", "''") for val in projected]
            values_str = ", ".join(f"'{val}'" for val in escaped_values)
            insert = f"INSERT INTO {table_name} ({', '.join(attributes)}) VALUES ({values_str});"
            output_lines.append(insert)
        
        output_lines.append("")  # Blank line between tables
    
    # Output results
    result = "\n".join(output_lines)
    
    if output_file:
        with open(output_file, 'w') as f:
            f.write(result)
        print(f"SQL INSERT statements written to {output_file}")
    else:
        print(result)
    
    return result

def main():
    if len(sys.argv) < 4:
        print("Usage: python generate_inserts.py <csv_file> <decomposition_file> <n_lines> [output_file]")
        print("Example: python generate_inserts.py data.csv decomposition.txt 100 inserts.sql")
        sys.exit(1)
    
    csv_file = sys.argv[1]
    decomp_file = sys.argv[2]
    n_lines = int(sys.argv[3])
    output_file = sys.argv[4] if len(sys.argv) > 4 else None
    
    try:
        generate_insert_statements(csv_file, decomp_file, n_lines, output_file)
    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
        sys.exit(1)

if __name__ == "__main__":
    main()