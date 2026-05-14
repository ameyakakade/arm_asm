hello_world: hello_world.o
	ld -o hello_world hello_world.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64 

hello_world.o: hello_world.s
	as -arch arm64 -o hello_world.o hello_world.s

