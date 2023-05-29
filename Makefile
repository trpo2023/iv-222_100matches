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

THIRDPARTY_DIR = thirdparty

TEST_SRC_DIR = test
TEST_OUT_NAME = matches-test
TEST_OBJ_DIR = $(OBJ_DIR)/$(TEST_OUT_NAME)
TEST_OBJECTS = $(TEST_OBJ_DIR)/ctest.o $(TEST_OBJ_DIR)/main.o

all: prepare $(EXECUTABLE)

$(EXECUTABLE): $(BUILD_DIR)/$(LIBRARY) $(MAIN_OBJ) 
	$(CC) $(CFLAGS) -o $@ $^ -I $(SRC_DIR) -L $(BUILD_DIR) -lmatches

$(BUILD_DIR)/$(LIBRARY): $(LIB_OBJ)
	ar rcs $@ $^

$(OBJ_DIR)/%.o: $(SRC_DIR)/lib/%.c
	$(CC) $(CFLAGS) -c $< -o $@

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $@ -I $(SRC_DIR)

# Test
test: prepare $(BUILD_DIR)/$(LIBRARY) $(BUILD_DIR)/$(TEST_OUT_NAME)/$(TEST_OUT_NAME)
	./$(BUILD_DIR)/$(TEST_OUT_NAME)/$(TEST_OUT_NAME)

$(BUILD_DIR)/$(TEST_OUT_NAME)/$(TEST_OUT_NAME): $(TEST_OBJECTS)
	$(CC) $(TEST_OBJECTS) -I$(THIRDPARTY_DIR) -Isrc -L$(BUILD_DIR) -lmatches -w -o $@

$(TEST_OBJ_DIR)/%.o: $(TEST_SRC_DIR)/%.c
	$(CC) -I$(THIRDPARTY_DIR) -Isrc -L$(BUILD_DIR) -lmatches -c $< -w -o $@

prepare:
	mkdir -p ./build ./build/matches-test ./obj ./obj/matches-test

run:
	./$(EXECUTABLE)

clean:
	rm -f -r $(OBJ_DIR)/*.o $(LIBRARY) $(EXECUTABLE) obj build

.PHONY: clean run prepare
