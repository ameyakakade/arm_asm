ifdef DEBUG
DEBUGFLAGS = -g
else
DEBUGFLAGS =
endif

all: branching printdword dowhile

branching: branching.o
	ld -o branching branching.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64 

branching.o: branching.s
	as $(DEBUGFLAGS) -gdwarf-4 -arch arm64 -o branching.o branching.s

printdword: printdword.o
	ld -o printdword printdword.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64 

printdword.o: printdword.s
	as $(DEBUGFLAGS) -gdwarf-4 -arch arm64 -o printdword.o printdword.s

dowhile: dowhile.o
	ld -o dowhile dowhile.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64 

dowhile.o: dowhile.s
	as $(DEBUGFLAGS) -gdwarf-4 -arch arm64 -o dowhile.o dowhile.s
