#include "iCONF.h"
#include "FDUtils.h"
#include <fstream>
#include <sstream>

FD parseFD(const std::string& line) {
    // Find the arrow
    size_t arrowPos = line.find("->");
    
    // Split into LHS and RHS
    std::string lhsStr = line.substr(0, arrowPos);
    std::string rhsStr = line.substr(arrowPos + 2);
    
    // Parse LHS (comma-separated attributes)
    AttributeSet lhs;
    std::stringstream lhsStream(lhsStr);
    std::string attr;
    
    while (std::getline(lhsStream, attr, ',')) {
        // Trim whitespace
        attr.erase(0, attr.find_first_not_of(" \t\n\r"));
        attr.erase(attr.find_last_not_of(" \t\n\r") + 1);
        
        if (!attr.empty()) {
             lhs = lhs.getUnion(AttributeSet{attr});
        }
    }
    
    // Parse RHS (comma-separated attributes)
    AttributeSet rhs;
    std::stringstream rhsStream(rhsStr);
    
    while (std::getline(rhsStream, attr, ',')) {
        // Trim whitespace
        attr.erase(0, attr.find_first_not_of(" \t\n\r"));
        attr.erase(attr.find_last_not_of(" \t\n\r") + 1);
        
        if (!attr.empty()) {
            rhs = rhs.getUnion(AttributeSet{attr});
        }
    }
    
    if (lhs.empty()) {
        throw std::runtime_error("Invalid FD: empty LHS in line: " + line);
    }
    if (rhs.empty()) {
        throw std::runtime_error("Invalid FD: empty RHS in line: " + line);
    }
    
    return FD(lhs, rhs);
}

int main(int argc, char** argv)
{
    if(argc != 4)
    {
        std::cout << "Usage: ./decompose.x attributeFile fdFile outputFile";
        return 0;
    }
    AttributeSet R;
    FDSet D;
    std::fstream inFile;

    inFile.open(argv[1], std::fstream::in);
    if(!inFile.is_open())
    {
        std::cout << "Could not open file " << argv[1] << "\n";
        return 0;
    }
    std::string line;
    while(getline(inFile, line))
    {
        R = R + AttributeSet{line};
    }
    inFile.close();
    inFile.clear();

    inFile.open(argv[2], std::fstream::in);
    if(!inFile.is_open())
    {
        std::cout << "Could not open file " << argv[2] << "\n";
        return 0;
    }
    while(getline(inFile, line))
    {
        line.erase(0, line.find_first_not_of(" \t\n\r"));
        if (line.empty() || line[0] == '#') {
            continue;
        }
        FD fd = parseFD(line);
        D.insert(fd);
    }
    inFile.close();
    inFile.clear();

    Decomposition iConfDecomp = iCONF(R, D);
    Decomposition ConfDecomp = CONF(R, D);
    Decomposition CoverDecomp = BCCover(R, D);

    std::fstream outFile;
    std::string basename = argv[3];
    std::string filename = basename + ".schema";
    outFile.open(filename, std::fstream::out);
    if(!outFile.is_open())
    {
        std::cerr << "Cannot write to file " << filename << "\n";
        return 1;
    }
    for(size_t i =  0; i < iConfDecomp.size(); ++i)
    {
        outFile << "R" << i+1 << "\n";
        for(const Attribute& A : iConfDecomp[i].attributes)
        {
            outFile << A << ",";
        }
        outFile << "\n";
        for(const FD& fd : iConfDecomp[i].fds)
        {
            for(const Attribute& A : fd.lhs)
            {
                outFile << A << ",";
            }
            outFile << "->";
            for(const Attribute& A : fd.rhs)
            {
                outFile << A << ",";
            }
            outFile << " ";
        }
        outFile << "\n";
    }
    outFile.close();
    outFile.clear();

    filename = basename + "Conf.schema";
    outFile.open(filename, std::fstream::out);
    if(!outFile.is_open())
    {
        std::cerr << "Cannot write to file " << filename << "\n";
        return 1;
    }

    for(size_t i =  0; i < ConfDecomp.size(); ++i)
    {
        outFile << "Conf" << i+1 << "\n";
        for(const Attribute& A : ConfDecomp[i].attributes)
        {
            outFile << A << ",";
        }
        outFile << "\n";
        for(const FD& fd : ConfDecomp[i].fds)
        {
            for(const Attribute& A : fd.lhs)
            {
                outFile << A << ",";
            }
            outFile << "->";
            for(const Attribute& A : fd.rhs)
            {
                outFile << A << ",";
            }
            outFile << " ";
        }
        outFile << "\n";
    }
    outFile.close();
    outFile.clear();

    filename = basename + "Cover.schema";
    outFile.open(filename, std::fstream::out);
    if(!outFile.is_open())
    {
        std::cerr << "Cannot write to file " << filename << "\n";
        return 1;
    }

    for(size_t i =  0; i < CoverDecomp.size(); ++i)
    {
        outFile << "Cover" << i+1 << "\n";
        for(const Attribute& A : CoverDecomp[i].attributes)
        {
            outFile << A << ",";
        }
        outFile << "\n";
        for(const FD& fd : CoverDecomp[i].fds)
        {
            for(const Attribute& A : fd.lhs)
            {
                outFile << A << ",";
            }
            outFile << "->";
            for(const Attribute& A : fd.rhs)
            {
                outFile << A << ",";
            }
            outFile << " ";
        }
        outFile << "\n";
    }
}