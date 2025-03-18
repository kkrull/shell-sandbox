#. ==zsh==

.PHONY: default
default: all

include ../../make.d/help.mk ../../make.d/pre-commit.mk

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
SUBDIRS := sode

.PHONY: $(SUBDIRS)
$(SUBDIRS):
	$(MAKE) -C $@ $(MAKECMDGOALS)

.PHONY: debug-project
debug-project:
	$(info Project:)
	$(info - SUBDIRS: $(SUBDIRS))
	@:

#. STANDARD TARGETS

.PHONY: all
all: $(SUBDIRS) #> Build all projects

.PHONY: clean
clean: $(SUBDIRS) #> Remove local build files

#TODO KDK: Add targets to install manuals (or put that in an adjacent project)
.PHONY: install
install: $(SUBDIRS) #> Copy artifacts to shared location

.PHONY: test
test: pre-commit-run $(SUBDIRS) #> Run tests

.PHONY: uninstall
uninstall: $(SUBDIRS)

#. SUPPORT TARGETS

.PHONY: debug
.NOTPARALLEL: debug
debug: _debug-prefix debug-programs debug-project $(SUBDIRS) #> Show debugging information

.PHONY: _debug-prefix
_debug-prefix:
	$(info ==zsh scripts==)
	@:

.PHONY: install-assets
install-assets: $(SUBDIRS)

.PHONY: install-tools
install-tools: $(SUBDIRS) #> Install development tools
