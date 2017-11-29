CC=arm-linux-gnueabihf-gcc
#HAD TO CHANGE AWAY FROM GNUEABI

#Default location for h files is ./source
CFLAGS= -std=gnu99 -Wall -Werror -I./src -L lib -lm -lpthread 

#h files used go here
DEPS= reg.h constants.h setup.h utils.h synth.h colour.h ini.h

#c files used go here (with .o extension)
OBJ = src/main.o src/reg.o src/utils.o src/synth.o src/colour.o src/ini.o

#name of generated binaries
BIN = milosar

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFlags)

milosar: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)

.PHONY: clean

clean:
	rm -f *.o src/*.o
