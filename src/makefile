CXX = g++
CXXFLAGS = -Wall -g -std=c++17

decompose.x: decompose.o FDUtils.o
	$(CXX) $(CXXFLAGS) decompose.o FDUtils.o -o decompose.x

decompose.o: decompose.cpp iCONF.h FDUtils.h
	$(CXX) $(CXXFLAGS) -c -o decompose.o decompose.cpp

FDUtils.o: FDUtils.cpp FDUtils.h
	$(CXX) $(CXXFLAGS) -c -o FDUtils.o FDUtils.cpp


clean:
	rm *.o *.x