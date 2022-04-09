FUNCTIONS ?= $(shell find src -type f -name '*.sh')

.PHONY: build clean

build: build/layer.zip $(FUNCTIONS:src/%.sh=build/%.zip)

clean:
	@rm -rf build layer

build/layer.zip: bin/jq
	@echo build Lambda layer
	@mkdir -p build
	@zip -qr $@ bin/

build/%.zip: src/%.sh src/bootstrap
	@echo build $<
	@mkdir -p build
	@zip --junk-paths --quiet $@ $< src/bootstrap

bin/jq:
	@mkdir -p bin
	@curl -fsSL https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 -o $@
	@chmod 755 $@
