PROJECT_ROOT := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
export PROJECT_ROOT

SRC := src
OBJ := obj
BIN := bin
INCLUDE := include

export SRC OBJ BIN INCLUDE

DIRS := $(patsubst $(SRC)/%, $(OBJ)/%, $(shell find $(SRC)/ -mindepth 1 -type d))
CREATE_DIR_COMMAND := ./dirs.sh

PROJECTS := test testlib.dll

.PHONY: all dirs clean

all: dirs $(PROJECTS)

# ---------------------- PROJECTS ----------------------

test:
	@$(MAKE) -C $(SRC)

testlib.dll: 
	@$(MAKE) -C $(SRC)/lib

# ---------------------- UTILITY ----------------------

dirs: 
	@mkdir -p $(BIN)
	@mkdir -p $(OBJ)
	@$(CREATE_DIR_COMMAND) $(DIRS)

clean:
	-@rm -rf $(OBJ)
	-@rm -rf $(BIN)
