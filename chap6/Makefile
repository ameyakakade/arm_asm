ifdef DEBUG
DEBUGFLAGS = -g
else
DEBUGFLAGS =
endif

all: uppercase

uppercase: main.o upper.o
	ld -o uppercase main.o upper.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64 

main.o: main.s
	as $(DEBUGFLAGS) -gdwarf-4 -arch arm64 -o main.o main.s

upper.o: upper.s
	as $(DEBUGFLAGS) -gdwarf-4 -arch arm64 -o upper.o upper.s
