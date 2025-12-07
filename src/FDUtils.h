#pragma once

#include <string>
#include <set>
#include <vector>
#include <unordered_map>
#include <unordered_set>
#include <algorithm>
#include <iostream>


typedef std::string Attribute;
class AttributeSet
{
    public:
    std::set<Attribute> attrs;
    
    AttributeSet() = default;
    AttributeSet(std::initializer_list<Attribute> atts) : attrs(atts) {};

    auto begin() { return attrs.begin(); };
    auto end() {return attrs.end(); };
    auto begin() const { return attrs.begin(); };
    auto end() const {return attrs.end(); };
    size_t size() const { return attrs.size(); };
    bool empty() const {return attrs.size() == 0; };

    bool contains(Attribute a) const { return attrs.count(a) > 0; };
    bool isSubset (const AttributeSet& other) const
    { 
        return std::includes(other.attrs.begin(), other.attrs.end(), attrs.begin(), attrs.end()); 
    };

    AttributeSet getUnion(const AttributeSet& other) const
    {
        AttributeSet Union;
        std::set_union(attrs.begin(), attrs.end(), other.attrs.begin(), other.attrs.end(), std::inserter(Union.attrs, Union.attrs.begin()));
        return Union;
    };
    AttributeSet intersection(const AttributeSet& other) const
    {
        AttributeSet Intersect;
        std::set_intersection(attrs.begin(), attrs.end(), other.attrs.begin(), other.attrs.end(), std::inserter(Intersect.attrs, Intersect.attrs.begin()));
        return Intersect;
    }
    AttributeSet difference(const AttributeSet& other) const
    {
        AttributeSet Difference;
        std::set_difference(attrs.begin(), attrs.end(), other.attrs.begin(), other.attrs.end(), std::inserter(Difference.attrs, Difference.attrs.begin()));
        return Difference;
    }
    
    AttributeSet operator+ (AttributeSet other)
    {
        return getUnion(other);
    }
    AttributeSet operator- (AttributeSet other)
    {
        return intersection(other);
    }
    bool operator==(AttributeSet other) const { return attrs == other.attrs; };
    bool operator!=(AttributeSet other) const { return attrs != other.attrs; };
    bool operator<(AttributeSet other) const { return attrs < other.attrs; };
};

class FD
{
    public:
    AttributeSet lhs;
    AttributeSet rhs;

    FD(const AttributeSet& l, const AttributeSet& r) : lhs(l), rhs(r) {};

    size_t size() const { return lhs.size() + rhs.size(); };

    bool operator==(FD other) const { return (lhs == other.lhs && rhs == other.rhs);};
    bool operator<(FD other) const {
        if(lhs != other.lhs) return lhs < other.lhs;
        return rhs < other.rhs;
    }
};

//typedef std::set<FD> FDSet;
class FDSet
{
    std::set<FD> fds;

    public:
    FDSet() = default;
    FDSet(const FD& fd)
    {
        fds.insert(fd);
    }
    
    void insert(const FD& fd) { fds.insert(fd); };
    void erase(const FD& fd) { fds.erase(fd); };

    auto begin() { return fds.begin(); };
    auto end() { return fds.end(); }
    const auto begin() const { return fds.begin(); };
    const auto end() const { return fds.end(); }

    size_t size() { return fds.size(); };

    FDSet project (const AttributeSet& R) const
    {
        FDSet result;
        for(const FD& fd : fds)
        {
            AttributeSet atts = fd.lhs.getUnion(fd.rhs);
            if(atts.isSubset(R))
                result.insert(fd);
        }
        return result;
    };
    bool contains(const FD& fd)
    {
        return fds.find(fd) != fds.end();
    }
    bool operator==(const FDSet& other)
    {
        return fds == other.fds;
    }
};

// Likely investigating the same FDSets several times, so we can save the initialzied version as an object to save some time
class ImpliesChecker 
{
    private:
    // Index: for each attribute A, store FDs where A is in the LHS
    std::unordered_map<Attribute, std::vector<const FD*>> attrList;
    
    // Count how many LHS attributes are still needed for each FD
    std::unordered_map<const FD*, int> counter;
    
    public:
    ImpliesChecker(const FDSet& FDs)
    {
        for(const auto& fd : FDs)
        {
            for(const auto& attr : fd.lhs)
            {
                attrList[attr].push_back(&fd);
            }
            counter[&fd] = fd.lhs.size();
        }
    }

    bool implies(const AttributeSet& X, const AttributeSet& Y);
    AttributeSet computeClosure(const AttributeSet& X) const;
};

class AtomicCoverComputer
{
    public:
    FDSet getAtomicCover(const FDSet& input);
    private:
    AttributeSet getAllAttributes(const FDSet& fds);
    std::vector<AttributeSet> generateAllSubsets(const AttributeSet& attrs);
};


class Schema
{
    public:
    FDSet fds;
    AttributeSet attributes;
    int k; // Number of minimal keys
    int f; // Number of non-key dependencies
    
    Schema(const AttributeSet& R, const FDSet& D, int k, int f) :
        fds(D), attributes(R), k(k), f(f) {};
    bool operator==(const Schema& other)
    {
        return fds == other.fds && attributes == other.attributes;
    }
};

FDSet minimalReduce(const FDSet& input);