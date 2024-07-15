PROJ_SRC := $(ROOT_PATH)/$(SRC)/app
PROJ_OBJ := $(ROOT_PATH)/$(OBJ)/app
PROJ_BIN := $(ROOT_PATH)/$(BIN)
PROJ_INCLUDE := $(ROOT_PATH)/$(INCLUDE)

CFLAGS := -Wall -Wextra -Werror -g -std=gnu17 -I$(ROOT_PATH)/$(SRC)
LDFLAGS := -Wl,-rpath=$(ROOT_PATH)/$(BIN) -L$(ROOT_PATH)/$(BIN) -l:doom-style-renderer.so

TARGET := $(PROJ_BIN)/test

SRCS := $(shell find $(PROJ_SRC) -type  f -name "*.c")
OBJS := $(patsubst $(PROJ_SRC)/%.c, $(PROJ_OBJ)/%.o, $(SRCS))
INCLUDES := $(shell find $(PROJ_INCLUDE) -type f -name "*.h")

all: $(TARGET)

$(TARGET): $(OBJS)
	@echo
	@echo building $(TARGET)
	@$(LD) $(CFLAGS) $(OBJS) -o $@ $(LDFLAGS)
	@echo built $(TARGET)

$(PROJ_OBJ)/%.o: $(PROJ_SRC)/%.c
	@echo building $@
	@$(CC) $(CFLAGS) -c $< -o $@
	@echo built $@
	@echo

