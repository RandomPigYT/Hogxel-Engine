PROJECTS := sdl


.PHONY: all sdl

all: $(PROJECTS)

sdl: ./SDL
	@echo Building SDL
	@mkdir -p ./build
	@cd ./build && cmake -G Ninja ../SDL > /dev/null
	@cd ./build && ninja
	@mkdir -p $(EXTERNAL_LIBS_DIR)/SDL
	@mv ./build/libSDL*.so* $(EXTERNAL_LIBS_DIR)/SDL
	@rm -rf ./build
	@echo Built SDL
	


