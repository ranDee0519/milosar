RP_HOST=root@0-26-32-f0-8-64.lan.uct.ac.za
DEST_DIR=/opt/redpitaya/rpc

# name of generated binary file
BIN = milosar

# must use gnueabihf
CC = arm-linux-gnueabihf-gcc

# libraries 
LIBS = -lm -lpthread

# header and objects directory relative to Makefile
IDIR = ./src
ODIR = ./src

# compiler flags
CFLAGS = -std=gnu99 -Wall -Werror -L -I$(IDIR)

# h files used go here
_DEPS = reg.h utils.h synth.h colour.h ini.h imu.h uart.h binary.h constants.h setup.h
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

# object files used go here (with .o extension)
_OBJ =  reg.o utils.o synth.o colour.o ini.o imu.o uart.o binary.o main.o
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))

$(ODIR)/%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

$(BIN): $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS) $(LIBS)
	scp $(BIN) $(RP_HOST):$(DEST_DIR)

.PHONY: clean

clean:
	rm -f $(ODIR)/*.o
