CMPL = gcc -m32 -c -ggdb
LNK = gcc -m32 -ggdb -no-pie

all: compile linking

compile: 
	$(CMPL) -o obj/telemetry.o src/telemetry.s
	$(CMPL) -o obj/main.o src/main.c
	
linking: 
	$(LNK) -o bin/telemetry obj/*.o

clear:
	rm -f obj/* bin/*
