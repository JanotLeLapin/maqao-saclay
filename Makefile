CC := g++
CFLAGS := -g --std=c++26 -Wall

.PHONY: clean maqao

maqao: main.cpp
	$(CC) $(CFLAGS) $^ -o $@

clean:
	rm -rf maqao

re: clean maqao
