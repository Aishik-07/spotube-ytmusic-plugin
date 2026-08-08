PLUGIN_NAME  := youtube-music
ENTRY        := src/segments/main.ht
OUTPUT       := $(PLUGIN_NAME).smplug
HETU_TOOLS   := hetu

.PHONY: build
build:
	$(HETU_TOOLS) compile $(ENTRY) -o $(OUTPUT)
	@echo "Built $(OUTPUT)"
