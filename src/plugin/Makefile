PROJ_SRC := $(ROOT_PATH)/$(SRC)
PROJ_OBJ := $(ROOT_PATH)/$(OBJ)
PROJ_BIN := $(ROOT_PATH)/$(BIN)
PROJ_INCLUDE := $(ROOT_PATH)/$(INCLUDE)

CFLAGS := -Wall -Wextra -Werror -g -std=gnu17 -fPIC
LDFLAGS :=

TARGET := $(PROJ_BIN)/plug.dll

SRCS := $(shell find $(PROJ_SRC) -type  f -name "*.c")
OBJS := $(patsubst $(PROJ_SRC)/%.c, $(PROJ_OBJ)/%.o, $(SRCS))
INCLUDES := $(shell find $(PROJ_INCLUDE) -type f -name "*.h")

all: $(TARGET)

$(TARGET): $(OBJS)
	@echo
	@echo building $(TARGET)
	@$(LD) $(CFLAGS) -shared $(OBJS) -o $@ $(LDFLAGS)
	@echo built $(TARGET)

$(OBJ)/%.o: $(SRC)/%.c
	@echo building $@
	@$(CC) $(CFLAGS) -c $< -o $@
	@echo built $@
	@echo

