CC = gcc

PREF_SRC = ./src/
PREF_OBJ = ./obj/
OUT_DIR = ./build

TARGET = $(OUT_DIR)/game

SRC = $(wildcard $(PREF_SRC)*.c)
OBJ = $(patsubst $(PREF_SRC)%.c, $(PREF_OBJ)%.o, $(SRC))

all: prepare $(TARGET)

$(TARGET) : $(OBJ)
	$(CC) $(OBJ) -o $(TARGET)
	
$(PREF_OBJ)%.o : $(PREF_SRC)%.c
	$(CC) -c $< -o $@

run:
	$(TARGET)
	
clean :
	rm $(TARGET) $(PREF_OBJ)*.o

prepare:
	mkdir -p ./obj ./build

.phony: all clean prepare
