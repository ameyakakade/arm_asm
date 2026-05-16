ifdef DEBUG
DEBUGFLAGS = -g
else
DEBUGFLAGS =
endif

all: ldrpc 

main: main.o
	ld -o main main.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64 

main.o: main.s
	as $(DEBUGFLAGS) -gdwarf-4 -arch arm64 -o main.o main.s
