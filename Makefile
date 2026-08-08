PLUGIN_NAME  := youtube-music
ENTRY        := src/segments/main.ht
BYTECODE     := build/plugin.out
OUTPUT       := $(PLUGIN_NAME).smplug
HETU_TOOLS   := hetu

.PHONY: compile archive build

compile:
	mkdir -p build
	$(HETU_TOOLS) compile $(ENTRY) $(BYTECODE)
	@echo "Compiled -> $(BYTECODE)"

archive:
	mkdir -p build/archive
	cp plugin.json $(BYTECODE) build/archive/
	cd build/archive && zip -r plugin.zip ./
	mv build/archive/plugin.zip $(OUTPUT)
	rm -rf build/archive
	@echo "Packaged -> $(OUTPUT)"

build: compile archive
