#pragma once

#include "FDUtils.h"
#include <vector>
#include <queue>
#include <iostream>

using Decomposition = std::vector<Schema>;

std::vector<Schema> critical(const FDSet& D);
std::pair<int, int> compute3NFCore(const AttributeSet& attrs, const FDSet& projection);
std::vector<AttributeSet> getAllMinimalKeys(const AttributeSet& R, const FDSet& D);
AttributeSet minimizeKey(const AttributeSet& A, const FDSet& D, const AttributeSet& K);
void opt3NF(std::vector<Schema> Dc, FDSet& WorkSet, const FDSet& Da, Decomposition& decomp);
std::vector<Schema> computeKeys(const FDSet& WorkSet, const FDSet& Da, const std::vector<Schema>& Dc);
void optBCNF(std::vector<Schema> BCNF, FDSet& WorkSet, const FDSet& Da, Decomposition& decomp);
Decomposition subset(const Decomposition& decomp);
void lossless(Decomposition& decomp, const AttributeSet& R, const FDSet& D);

Decomposition iCONF(const AttributeSet& R, const FDSet& D/* const Order& O_3NF, const Order& O_BCNF*/)
{
    AtomicCoverComputer atomicComp;
    FDSet Da = atomicComp.getAtomicCover(D);

    // Copy of atomic cover to be modified
    // The original version had the calculated atomic cover used as DaBar, which was
    // our working set, and then Da is kept as an original. As long as usage is consistent,
    // this should be identical
    FDSet WorkSet = Da;

    // Critical - identify critical schemata
    std::vector<Schema> Dc = critical(Da);
    //std::cout << "DEBUG: Critical done\n";

    Decomposition decomp;
    // Opt-3NF - optimize critical schemata
    opt3NF(Dc, WorkSet, Da, decomp);
    //std::cout << "DEBUG: opt3NF done\n";

    // Key - compute keys for BCNF schemata
    std::vector<Schema> BCNF = computeKeys(WorkSet, Da, Dc);
    //std::cout << "DEBUG: Key done\n";

    // Opt-BCNF - optimize BCNF schemata
    optBCNF(BCNF, WorkSet, Da, decomp);
    //std::cout << "DEBUG: optBCNF done\n";

    // Subset - remove redundant schemata
    decomp = subset(decomp);
    //std::cout << "DEBUG: subset done\n";

    // Lossless - ensure lossless join
    lossless(decomp, R, D);
    //std::cout << "DEBUG: lossless done\n";

    return decomp;
}


std::vector<Schema> critical(const FDSet& D)
{
    std::vector<Schema> Dc;
    for(const FD& fd : D)
    {
        AttributeSet XA = fd.lhs.getUnion(fd.rhs);
        /*std::cout << "DEBUG: Checking FD ";
        for(const Attribute A : fd.lhs)
        {
            std::cout << A;
        }
        std::cout << "->";
        for(const Attribute A : fd.rhs)
        {
            std::cout << A;
        }
        std::cout << "\n";*/
        
        bool isCritical = false;

        for(const FD& otherFD : D)
        {
            AttributeSet YB = otherFD.lhs.getUnion(otherFD.rhs);

            // Check if YB is subset of XA. 
            if(YB.isSubset(XA))
            {
                // If so, check if XB not in closure of Y
                /*std::cout << "DEBUG: ";
                for(const Attribute A : otherFD.lhs)
                {
                    std::cout << A;
                }
                std::cout << "->";
                for(const Attribute A : otherFD.rhs)
                {
                    std::cout << A;
                }
                std::cout << " is a subset of FD\n";*/
                
                FDSet projection = D.project(XA);
                ImpliesChecker checker(projection);
                AttributeSet closure = checker.computeClosure(otherFD.lhs);

                if(!XA.isSubset(closure))
                {
                    isCritical = true;
                    //std::cout << "And is not in the closure, so this is a critical FD\n";
                    break;
                }
            }
        }
        if(isCritical)
        {
            std::pair<int, int> Core;
            // Compute kxa, fxa in target 3NF-core of Da[XA]

            // Get Da[XA]
            FDSet projection = D.project(XA);
            /*std::cout << "DEBUG: Computing 3NF-Core in XA=";
            for(const Attribute& A : XA)
            {
                std::cout << A;
            }*/
            Core = compute3NFCore(XA, projection);

            Dc.push_back(Schema(XA, FDSet(fd), Core.first, Core.second));
        }
    }
    return Dc;
}


std::pair<int, int> compute3NFCore(const AttributeSet& attrs, const FDSet& projection)
{
    std::vector<AttributeSet> Keys = getAllMinimalKeys(attrs, projection);
    FDSet nonKey;

    // Find all non-key FDs
    for(const FD& fd : projection)
    {
        bool isKey = false;
        for(const AttributeSet& key : Keys)
        {
            if(key.isSubset(fd.lhs))
            {
                isKey = true;
                break;
            }
        }

        if(!isKey)
        {
            nonKey.insert(fd);
        }
    }

    nonKey = minimalReduce(nonKey);

    int k = Keys.size();
    int f = nonKey.size();

    /*std::cout << "DEBUG: 3NF-Core:\n"
        << "Attributes XA: ";
    for(const Attribute& att : attrs)
    {
        std::cout << att << " ";
    }
    std::cout << "\nFDs involved: ";
    for(const FD& fd : projection)
    {
        for(const Attribute A : fd.lhs)
        {
            std::cout << A;
        }
        std::cout << "->";
        for(const Attribute A : fd.rhs)
        {
            std::cout << A;
        }
        std::cout << " ";
    }
    std::cout << "\nMinimal keys: ";
    for(const AttributeSet& Key : Keys)
    {
        for(const Attribute& A : Key)
        {
            std::cout << A;
        }
        std::cout << " ";
    }
    std::cout << "\nNon-key FDs: ";
    for(const FD& fd : nonKey)
    {
        for(const Attribute A : fd.lhs)
        {
            std::cout << A;
        }
        std::cout << "->";
        for(const Attribute A : fd.rhs)
        {
            std::cout << A;
        }
        std::cout << " ";
    }*/

    return { k, f };
}


std::vector<AttributeSet> getAllMinimalKeys(const AttributeSet& R, const FDSet& D)
{
    std::set<AttributeSet> Keys;

    AttributeSet initialKey = minimizeKey(R, D, R);
    Keys.insert(initialKey);

    std::queue<AttributeSet> process;
    process.push(initialKey);

    while(!process.empty())
    {
        AttributeSet K = process.front();
        process.pop();

        for(const FD& fd : D)
        {
            // S <- L U (K-R)
            AttributeSet KminusR = K.difference(fd.rhs);
            AttributeSet S = fd.lhs.getUnion(KminusR);
            
            bool test = true;
            for(const AttributeSet& J : Keys)
            {
                if(J.isSubset(S))
                    test = false;
            }
            if(test)
            {
                AttributeSet newKey = minimizeKey(R, D, S);

                if(Keys.find(newKey) == Keys.end())
                {
                    Keys.insert(newKey);
                    process.push(newKey);
                }
            }
        }
    }
    return std::vector<AttributeSet>(Keys.begin(), Keys.end());
}

AttributeSet minimizeKey(const AttributeSet& A, const FDSet& D, const AttributeSet& K)
{
    AttributeSet Key = K;
    ImpliesChecker checker(D);

    std::vector<Attribute> attrs(K.begin(), K.end());
    for(const Attribute& b : attrs)
    {
        // If Key-b is still a key, remove it from Key
        AttributeSet test = Key - AttributeSet{b};
        AttributeSet testClosure = checker.computeClosure(test);
        // The only way A can be a subset of our closure is if they're equal,
        // Which means that the current attribute set is a key
        if(A.isSubset(testClosure))
        {
            Key = test;
        }
    }
    return Key;
}

void opt3NF(std::vector<Schema> Dc, FDSet& WorkSet, const FDSet& Da, Decomposition& decomp)
{
    // Place Dc in reverse ordering by number of non-key FDs
    // This is equivalent to O-3NF being <f
    std::sort(Dc.begin(), Dc.end(), [](const Schema& a, const Schema& b){
        return a.f > b.f;
    });

    for(const Schema& schema : Dc)
    {
        // Get the generating FD for this criticial schema
        // This requires that all schema in Dc have only their generating FD added
        const FD& fd = *schema.fds.begin();

        FDSet checkSet = WorkSet;
        checkSet.erase(fd);
        ImpliesChecker checker(checkSet);

        if(!checker.implies(fd.lhs, fd.rhs))
        {
            // Schema is not redundant - add it to our decomposition
            AttributeSet attrs = fd.lhs.getUnion(fd.rhs);
            FDSet fds = Da.project(attrs);
            decomp.push_back(Schema(attrs, fds, schema.k, schema.f));
        }
        else
        {
            // Schema is redundant - remove it from our working set
            WorkSet.erase(fd);
        }
    }
}

std::vector<Schema> computeKeys(const FDSet& WorkSet, const FDSet& Da, const std::vector<Schema>& Dc)
{
    std::vector<Schema> BCNF;

    // Grab all the critical FDs from Dc
    FDSet critFDs;
    for(const Schema& schema : Dc)
    {
        critFDs.insert(*schema.fds.begin());
    }

    // For all FDs in Da/Dc:
    for(const FD& fd : WorkSet)
    {
        // Skip processing critical FDs
        if(critFDs.contains(fd)) continue;

        AttributeSet schema = fd.lhs.getUnion(fd.rhs);
        FDSet projection = Da.project(schema);
        std::vector<AttributeSet> minimalKeys = getAllMinimalKeys(schema, projection);
        int k = minimalKeys.size();

        BCNF.push_back(Schema(schema, FDSet(fd), k, 0));
    }

    return BCNF;
}

void optBCNF(std::vector<Schema> BCNF, FDSet& WorkSet, const FDSet& Da, Decomposition& decomp)
{
    std::sort(BCNF.begin(), BCNF.end(), [](const Schema& a, const Schema& b){
        return a.k > b.k;
    });

    for(const Schema& schema : BCNF)
    {
        const FD& fd = *schema.fds.begin();

        FDSet checkSet = WorkSet;
        checkSet.erase(fd);
        ImpliesChecker checker(checkSet);

        if(!checker.implies(fd.lhs, fd.rhs))
        {
            // Schema is not redundant - add it to our decomposition
            AttributeSet attrs = fd.lhs.getUnion(fd.rhs);
            FDSet fds = Da.project(attrs);
            decomp.push_back(Schema(attrs, fds, schema.k, 0));
        }
        else
        {
            // Schema is redundant - remove it from our working set
            WorkSet.erase(fd);
        }
    }
}

Decomposition subset(const Decomposition& decomp)
{
    std::vector<Schema> filtered;

    for(size_t i = 0; i < decomp.size(); ++i)
    {
        bool isProperSubset = false;

        for(size_t j = 0; j < decomp.size(); ++j)
        {
            if(i != j)
            {
                bool subset = decomp[i].attributes.isSubset(decomp[j].attributes);
                bool proper = decomp[i].attributes.size() < decomp[j].attributes.size();

                if(subset && proper)
                {
                    isProperSubset = true;
                    break;
                }
                // Check against duplicates
                if(subset && !proper)
                {
                    if(j < i && decomp[i].attributes == decomp[j].attributes)
                    {
                        isProperSubset = true;
                    }
                }
            }
        }
        if(!isProperSubset)
        {
            filtered.push_back(decomp[i]);
        }
    }

    return filtered;
}

void lossless(Decomposition& decomp, const AttributeSet& R, const FDSet& D)
{
    bool hasKey = false;

    ImpliesChecker checker(D);
    for(const Schema& schema : decomp)
    {
        AttributeSet closure = checker.computeClosure(schema.attributes);
        if(R.isSubset(closure))
        {
            hasKey = true;
            break;
        }
    }

    if(!hasKey)
    {
        AttributeSet minimalKey = minimizeKey(R, D, R);
        FDSet KeyFDs = D.project(minimalKey);
        decomp.push_back(Schema(minimalKey, KeyFDs, 1, 0));
    }
}

Decomposition CONF(const AttributeSet& R, const FDSet& D)
{
    Decomposition decomp;
    AtomicCoverComputer atomicComp;
    FDSet Da = atomicComp.getAtomicCover(D);

    // Copy of atomic cover to be modified
    // The original version had the calculated atomic cover used as DaBar, which was
    // our working set, and then Da is kept as an original. As long as usage is consistent,
    // this should be identical
    FDSet WorkSet = Da;

    // Eliminate critical schemata
    // Create copy that's safe to iterate over
    std::vector<FD> iterSet(WorkSet.begin(), WorkSet.end());
    for(const FD& fd : iterSet)
    {
        AttributeSet XA = fd.lhs.getUnion(fd.rhs);
        
        bool isCritical = false;

        for(const FD& otherFD : Da)
        {
            AttributeSet YB = otherFD.lhs.getUnion(otherFD.rhs);

            // Check if YB is subset of XA. 
            if(YB.isSubset(XA))
            {   
                FDSet projection = Da.project(XA);
                ImpliesChecker checker(projection);
                AttributeSet closure = checker.computeClosure(otherFD.lhs);

                if(!XA.isSubset(closure))
                {
                    isCritical = true;
                    break;
                }
            }
        }
        if(isCritical)
        {
            FDSet testSet = WorkSet;
            testSet.erase(fd);
            ImpliesChecker checker(testSet);
            // Remove redundant critical schemata
            if(checker.implies(fd.lhs, fd.rhs))
            {
                WorkSet.erase(fd);
            }
        }
    }

    std::vector<Schema> BCNF;

    for(const FD& fd : WorkSet)
    {
        AttributeSet schema = fd.lhs.getUnion(fd.rhs);
        FDSet projection = Da.project(schema);
        std::vector<AttributeSet> minimalKeys = getAllMinimalKeys(schema, projection);
        int k = minimalKeys.size();

        BCNF.push_back(Schema(schema, FDSet(fd), k, 0));
    }

    std::sort(BCNF.begin(), BCNF.end(), [](const Schema& a, const Schema& b){
        return a.k > b.k;
    });

    for(const Schema& schema : BCNF)
    {
        const FD& fd = *schema.fds.begin();

        FDSet checkSet = WorkSet;
        checkSet.erase(fd);
        ImpliesChecker checker(checkSet);

        if(!checker.implies(fd.lhs, fd.rhs))
        {
            // Schema is not redundant - add it to our decomposition
            AttributeSet attrs = fd.lhs.getUnion(fd.rhs);
            FDSet fds = Da.project(attrs);
            decomp.push_back(Schema(attrs, fds, schema.k, 0));
        }
        else
        {
            // Schema is redundant - remove it from our working set
            WorkSet.erase(fd);
        }
    }
    decomp = subset(decomp);

    // Lossless - ensure lossless join
    lossless(decomp, R, D);

    return decomp;
}

Decomposition BCCover(const AttributeSet& R, const FDSet& D) {
    AtomicCoverComputer atomComp;
    FDSet Da = atomComp.getAtomicCover(D);
    FDSet DaWorking = Da;
    Decomposition decomp;
    
    // Process each FD
    for (const auto& fd : Da) {
        // Check if it's redundant
        FDSet checkSet = DaWorking;
        checkSet.erase(fd);
        ImpliesChecker checker(checkSet);
        
        if (!checker.implies(fd.lhs, fd.rhs)) {
            // Schema is not redundant - add it to our decomposition
            AttributeSet schema = fd.lhs.getUnion(fd.rhs);
            FDSet schemaFDs = Da.project(schema);
            decomp.push_back(Schema(schema, schemaFDs, 0, 0));
        } else {
            // Schema is redundant - remove it from our working set
            DaWorking.erase(fd);
        }
    }
    
    subset(decomp);
    lossless(decomp, R, D);

    Decomposition final;
    for(size_t i = 1; i < decomp.size(); ++i)
    {
        bool dupliate = false;
        for(size_t j = 0; j < i; ++j)
        {
            if(decomp[i] == decomp[j])
            {
                dupliate = true;
                break;
            }
        }
        if(!dupliate)
        {
            final.push_back(decomp[i]);
        }
    }
    std::swap(final, decomp);
    
    return decomp;
}