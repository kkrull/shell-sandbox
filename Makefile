#. ==Shell Sandbox==

.PHONY: default
default: all

## Sources

## Artifacts

## Paths

## Programs

.PHONY: debug-programs
debug-programs:
	$(info Programs:)
	@:

## Project

# https://stackoverflow.com/a/17845120/112682
SUBDIRS := src/zsh

.PHONY: $(SUBDIRS)
$(SUBDIRS):
	$(MAKE) -C $@ $(MAKECMDGOALS)

.PHONY: debug-project
debug-project:
	$(info Project:)
	$(info - SUBDIRS: $(SUBDIRS))
	@:

include make.d/direnv.mk make.d/help.mk make.d/pre-commit.mk

#. STANDARD TARGETS

.PHONY: all
all: $(SUBDIRS) #> Build all projects

.PHONY: clean
clean: pre-commit-gc $(SUBDIRS) #> Remove local build files

.PHONY: install
install: $(SUBDIRS) #> Copy artifacts to shared location

.PHONY: test
test: pre-commit-run $(SUBDIRS) #> Run tests

.PHONY: uninstall
uninstall: $(SUBDIRS) #> Remove artifacts from shared location

#. SUPPORT TARGETS

.PHONY: debug
.NOTPARALLEL: debug
debug: _debug-prefix debug-programs debug-project $(SUBDIRS) #> Show debugging information

.PHONY: _debug-prefix
_debug-prefix:
	$(info ==Shell Sandbox==)
	@:

.PHONY: install-assets
install-assets: $(SUBDIRS)

.PHONY: install-tools
install-tools: pre-commit-install $(SUBDIRS)
