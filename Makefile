MAKEFLAGS += --no-print-directory

ROOT_PATH := $(patsubst %/, %, $(dir $(abspath $(lastword $(MAKEFILE_LIST)))))
export ROOT_PATH

CC := gcc
LD := gcc

SRC := src
OBJ := obj
BIN := bin
INCLUDE := include

export CC LD SRC OBJ BIN INCLUDE

DIRS := $(patsubst $(SRC)/%, $(OBJ)/%, $(shell find $(SRC)/ -mindepth 1 -type d))
CREATE_DIR_COMMAND := ./dirs.sh

PROJECTS := test plug.dll

.PHONY: all dirs clean

all: dirs $(PROJECTS)

# ---------------------- PROJECTS ----------------------

test:
	@$(MAKE) -C $(SRC)/app

plug.dll: 
	@$(MAKE) -C $(SRC)/plugin

# ---------------------- UTILITY ----------------------

dirs: 
	@mkdir -p $(BIN) 
	@mkdir -p $(OBJ)
	@$(CREATE_DIR_COMMAND) $(DIRS)

clean:
	-@rm -rf $(OBJ)
	-@rm -rf $(BIN)
