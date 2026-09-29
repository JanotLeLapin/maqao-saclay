CC := g++
CXXFLAGS := -g -std=c++26 -fmodules -Wall -Wextra

.PHONY: clean maqao

maqao: main.cpp gcm.cache/std.gcm
	$(CXX) $(CXXFLAGS) main.cpp -o $@

gcm.cache/std.gcm:
	$(CXX) $(CXXFLAGS) -fsearch-include-path -fmodule-only -c bits/std.cc

clean:
	rm -rf maqao *.cache

re: clean maqao
