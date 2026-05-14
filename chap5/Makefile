ifdef DEBUG
DEBUGFLAGS = -g
else
DEBUGFLAGS =
endif

all: ldrpc loadfrommem array uppercase lowercase

ldrpc: ldrpc.o
	ld -o ldrpc ldrpc.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64 

ldrpc.o: ldrpc.s
	as $(DEBUGFLAGS) -gdwarf-4 -arch arm64 -o ldrpc.o ldrpc.s

loadfrommem: loadfrommem.o
	ld -o loadfrommem loadfrommem.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64 

loadfrommem.o: loadfrommem.s
	as $(DEBUGFLAGS) -gdwarf-4 -arch arm64 -o loadfrommem.o loadfrommem.s

array: array.o
	ld -o array array.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64 

array.o: array.s
	as $(DEBUGFLAGS) -gdwarf-4 -arch arm64 -o array.o array.s

uppercase: uppercase.o
	ld -o uppercase uppercase.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64 

uppercase.o: uppercase.s
	as $(DEBUGFLAGS) -gdwarf-4 -arch arm64 -o uppercase.o uppercase.s

lowercase: lowercase.o
	ld -o lowercase lowercase.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64 

lowercase.o: lowercase.s
	as $(DEBUGFLAGS) -gdwarf-4 -arch arm64 -o lowercase.o lowercase.s
