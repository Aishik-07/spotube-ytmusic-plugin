PLUGIN_NAME := youtube-music
ENTRY       := src/segments/main.ht
BYTECODE    := build/plugin.out
OUTPUT      := $(PLUGIN_NAME).smplug

.PHONY: build compile archive clean rebuild

# ── Step 1: compile hetu_script → bytecode ───────────────────────────────────
compile:
	mkdir -p build
	hetu compile $(ENTRY) $(BYTECODE)
	@echo "✅  Compiled  → $(BYTECODE)"

# ── Step 2: bundle plugin.json + bytecode into .smplug (zip) ─────────────────
archive:
	mkdir -p build/archive
	cp plugin.json $(BYTECODE) build/archive/
	cd build/archive && zip -r plugin.zip .
	mv build/archive/plugin.zip $(OUTPUT)
	rm -rf build/archive
	@echo "✅  Packaged  → $(OUTPUT)"

# ── Default target ────────────────────────────────────────────────────────────
build: compile archive

clean:
	rm -rf build $(OUTPUT)

rebuild: clean build
