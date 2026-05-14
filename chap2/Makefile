ifdef DEBUG
DEBUGFLAGS = -g
else
DEBUGFLAGS =
endif

movexamples: movexamples.o
	ld -o movexamples movexamples.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64 

movexamples.o: movexamples.s
	as $(DEBUGFLAGS) -gdwarf-4 -arch arm64 -o movexamples.o movexamples.s
