BUILD = build/

ifdef DEBUG
DEBUGFLAGS = -g
else
DEBUGFLAGS =
endif

all: $(BUILD)uppercase $(BUILD)uppercasec $(BUILD)stackframec

$(BUILD)uppercasec: $(BUILD)upper.o uppercasetest.c
	clang -o $(BUILD)uppercasec uppercasetest.c $(BUILD)upper.o

$(BUILD)uppercase: $(BUILD)main.o $(BUILD)upper.o
	ld -o $(BUILD)uppercase main.o upper.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64 

$(BUILD)main.o: main.s
	as $(DEBUGFLAGS) -gdwarf-4 -arch arm64 -o $(BUILD)main.o main.s

$(BUILD)upper.o: upper.s
	as $(DEBUGFLAGS) -gdwarf-4 -arch arm64 -o $(BUILD)upper.o upper.s

$(BUILD)stackframec: $(BUILD)stackframe.o printwordtest.c
	clang -o $(BUILD)stackframec printwordtest.c $(BUILD)stackframe.o

$(BUILD)stackframe.o: stackframe.s
	as $(DEBUGFLAGS) -gdwarf-4 -arch arm64 -o $(BUILD)stackframe.o stackframe.s
