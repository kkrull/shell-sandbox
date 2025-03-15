#. ==(Brode)sode==

.PHONY: default
default: all

## Sources

# NB: the wildcard function is not recursive: https://stackoverflow.com/a/2483203/112682
sources := $(shell find . -type f -name '*.zsh' | sort)

.PHONY: debug-sources
debug-sources:
	$(info Sources:)
	$(info - sources: $(sources))
	@:

## Artifacts

.PHONY: debug-artifacts
debug-artifacts:
	$(info Artifacts:)
	@:

## Paths

.PHONY: debug-paths
debug-paths:
	$(info Paths:)
	@:

## Programs

.PHONY: debug-programs
debug-programs:
	$(info Programs:)
	@:

#. STANDARD TARGETS

.NOTPARALLEL: all
.PHONY: all
all: #> Build all artifacts
	@:

.PHONY: clean
clean: #> Remove files built from these sources
	@:

.PHONY: install
install:
	@:

.PHONY: test
test: #> Run tests
	@:

.PHONY: uninstall
uninstall:
	@:

#. SUPPORT TARGETS

.PHONY: debug
.NOTPARALLEL: debug
debug: _debug-prefix debug-artifacts debug-paths debug-programs debug-sources #> Show debugging information
	@:

.PHONY: _debug-prefix
_debug-prefix:
	$(info ==(Brode)sode==)
	@:

# https://stackoverflow.com/a/47107132/112682
.PHONY: help
help: #> Show this help
	@sed -n \
		-e '/@sed/!s/#[.] */_margin_\n/p' \
		-e '/@sed/!s/:.*#> /:/p' \
		$(MAKEFILE_LIST) \
	| column -ts : | sed -e 's/_margin_//'

.PHONY: install-assets
install-assets:
	@:

.PHONY: install-tools
install-tools:
	@:
