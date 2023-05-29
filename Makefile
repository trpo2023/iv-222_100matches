CC = gcc
CFLAGS = -Wall -Wextra -Wpedantic
LIBRARY = libmatches.a
SRC_DIR = src
OBJ_DIR = obj
BUILD_DIR = build

LIB_SRC = $(SRC_DIR)/lib/matches_game.c
MAIN_SRC = $(SRC_DIR)/main.c

LIB_OBJ = $(patsubst $(SRC_DIR)/lib/%.c,$(OBJ_DIR)/%.o,$(LIB_SRC))
MAIN_OBJ = $(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/%.o,$(MAIN_SRC))

EXECUTABLE = $(BUILD_DIR)/game

all: prepare $(EXECUTABLE)

$(EXECUTABLE): $(BUILD_DIR)/$(LIBRARY) $(MAIN_OBJ) 
	$(CC) $(CFLAGS) -o $@ $^ -I $(SRC_DIR) -L $(BUILD_DIR) -lmatches

$(BUILD_DIR)/$(LIBRARY): $(LIB_OBJ)
	ar rcs $@ $^

$(OBJ_DIR)/%.o: $(SRC_DIR)/lib/%.c
	$(CC) $(CFLAGS) -c $< -o $@

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $@ -I $(SRC_DIR)

prepare:
	mkdir -p ./build ./obj

run:
	./$(EXECUTABLE)

clean:
	rm -f $(OBJ_DIR)/*.o $(LIBRARY) $(EXECUTABLE)

.PHONY: clean run prepare
