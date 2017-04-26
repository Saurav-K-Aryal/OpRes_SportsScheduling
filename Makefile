#
# Makefile for Sports Scheduling library
#

ARCH = $(shell $(CXX) -dumpmachine)
CFLAGS = 

OPT = -O3 -Wall -Werror -ffast-math  -ftree-vectorize -std=c++0x

CPP_FILES = $(wildcard src/*.cpp)
OBJ_FILES = $(addprefix src/,$(notdir $(CPP_FILES:.cpp=.o)))

all: test

test: $(OBJ_FILES)
	$(CXX) $(OPT) -o $@ $^

src/%.o: src/%.cpp
	$(CXX) $(OPT) $(CFLAGS) -c -o $@ $<

clean: 
	-rm -f src/*.o test
