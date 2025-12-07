#include "FDUtils.h"
#include <queue>

AttributeSet ImpliesChecker::computeClosure(const AttributeSet& X) const
{
    std::unordered_set<Attribute> closure(X.begin(), X.end());
    std::queue<Attribute> check;

    for(const auto& attr : X)
    {
        check.push(attr);
    }

    // Local copy of counter
    auto count = counter;
    while(!check.empty())
    {
        Attribute nextAttr = check.front();
        check.pop();

        if(attrList.count(nextAttr) == 0) continue;

        for(const FD* fd : attrList.at(nextAttr))
        {
            --count[fd];

            if(count[fd] == 0)
            {
                for(const auto& j : fd->rhs)
                {
                    if(closure.insert(j).second)
                    {
                        check.push(j);
                    }
                }
            }
        }
    }

    AttributeSet result;
    for (const auto& attr : closure) {
        result = result.getUnion(AttributeSet{attr});
    }
    
    return result;
}

bool ImpliesChecker::implies(const AttributeSet& X, const AttributeSet& Y)
{
    // Check for trivial case
    if(Y.isSubset(X)) return true;

    AttributeSet closure = computeClosure(X);
    /*std::queue<Attribute> check;

    for(const auto& attr : X)
    {
        check.push(attr);
    }

    // Local copy of counter
    auto count = counter;
    while(!check.empty())
    {
        Attribute nextAttr = check.front();
        check.pop();

        if(attrList.count(nextAttr) == 0) continue;

        for(const FD* fd : attrList.at(nextAttr))
        {
            --count[fd];

            if(count[fd] == 0)
            {
                for(const auto& j : fd->rhs)
                {
                    if(closure.attrs.insert(j).second)
                    {
                        check.push(j);
                    }
                }
            }
        }
    }

    for (const auto& attr : Y)
    {
        if(closure.attrs.count(attr) == 0) return false;
    }
    return true;*/

    return Y.isSubset(closure);
};

FDSet AtomicCoverComputer::getAtomicCover(const FDSet& input)
{
    AttributeSet allAttrs = getAllAttributes(input);
    FDSet result;
    
    // Generate all attribute subsets as potential LHS
    std::vector<AttributeSet> allSubsets = generateAllSubsets(allAttrs);
    
    ImpliesChecker checker(input);
    
    for (const auto& lhs : allSubsets) {
        if (lhs.empty()) continue;
        
        // Compute closure of lhs
        AttributeSet closure = checker.computeClosure(lhs);
        
        // For each attribute in closure but not in lhs
        for (const Attribute& attr : closure) {
            if (lhs.contains(attr)) continue;
            
            FD candidate(lhs, AttributeSet{attr});

            // For each attribute in closure but not in lhs
            for (const auto& attr : closure) {
                if (lhs.contains(attr)) continue;
                
                FD candidate(lhs, AttributeSet{attr});
                
                // Check if this FD is minimal (no proper subset of lhs implies attr)
                bool isMinimal = true;
                for (const auto& removeAttr : lhs) {
                    AttributeSet smallerLHS = lhs.difference(AttributeSet{removeAttr});
                    if (checker.implies(smallerLHS, AttributeSet{attr})) {
                        isMinimal = false;
                        break;
                    }
                }
                
                if (isMinimal) {
                    result.insert(candidate);
                }
            }
        }
        
    }
    return result;
};

AttributeSet AtomicCoverComputer::getAllAttributes(const FDSet& fds)
{
    AttributeSet result;
    for (const auto& fd : fds) {
        result = result.getUnion(fd.lhs).getUnion(fd.rhs);
    }
    return result;
};

std::vector<AttributeSet> AtomicCoverComputer::generateAllSubsets(const AttributeSet& attrs)
{
    std::vector<AttributeSet> result;
        std::vector<Attribute> attrList(attrs.begin(), attrs.end());
        int n = attrList.size();
        
        // Generate all 2^n subsets
        for (int mask = 0; mask < (1 << n); mask++) {
            AttributeSet subset;
            for (int i = 0; i < n; i++) {
                if (mask & (1 << i)) {
                    subset = subset.getUnion(AttributeSet{attrList[i]});
                }
            }
            result.push_back(subset);
        }
        
        return result;
};

FDSet minimalReduce(const FDSet& input)
{
    FDSet result;

    // Atomize FDSet (should likely be atomized in most cases already since we're working off an atomic cover)
    for(const FD& fd : input)
    {
        for(const Attribute& a : fd.rhs)
        {
            result.insert(FD(fd.lhs, AttributeSet{a}));
        }
    }

    // Left-reduce
    bool changed = true;
    while(changed)
    {
        changed = false;
        FDSet newSet;

        for(const FD& fd : result)
        {
            AttributeSet lhs = fd.lhs;
            // Create vector copy for safe iteration
            std::vector<Attribute> attrs(lhs.begin(), lhs.end());

            // Test if each attribute is redundant
            for(const Attribute& attr : attrs)
            {
                AttributeSet reduced = lhs.difference(AttributeSet{attr});

                // If lhs is a single attribute it is obviously not redundant
                if(reduced.empty()) continue;

                FDSet tempCheck = result;
                tempCheck.erase(fd);
                FD reducedFD = FD(reduced, fd.rhs);
                tempCheck.insert(reducedFD);
                ImpliesChecker checker(tempCheck);
                // If the original FD is implied by our reduced cover, the attribute was redundant
                if(checker.implies(fd.lhs, fd.rhs))
                {
                    lhs = reduced;
                    changed = true;
                }
            }
            
            newSet.insert(FD(lhs, fd.rhs));
        }
        result = newSet;
    }

    // Remove redundant FDs
    changed = true;
    while(changed)
    {
        changed = false;
        FDSet reduced;
        std::vector<FD> FDList(result.begin(), result.end());

        for(const FD& fd : FDList)
        {
            // Test if this FD is redundant
            reduced = result;
            reduced.erase(fd);
            ImpliesChecker checker(reduced);
            if(checker.implies(fd.lhs, fd.rhs))
            {
                result.erase(fd);
                changed = true;
            }
        }
    }

    return result;
}