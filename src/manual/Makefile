#. ==Manuals==

# Guide: https://eddieantonio.ca/blog/2015/12/18/authoring-manpages-in-markdown-with-pandoc/
# man-pages conventions: https://linux.die.net/man/7/man-pages

.PHONY: default
default: all

include ../../make.d/help.mk ../../make.d/paths-system.mk

### Sources

sources := $(shell find . -type f -name '*.md' | sort)
sources_man1 := $(filter %.1.md,$(sources))
sources_man7 := $(filter %.7.md,$(sources))

.PHONY: debug-sources
debug-sources:
	$(info Sources:)
	$(info - sources: $(sources))
	$(info - sources_man1: $(sources_man1))
	$(info - sources_man7: $(sources_man7))
	@:

## Artifacts

objects_man1 := $(patsubst pandoc/%.md,groff/%,$(sources_man1))
objects_man7 := $(patsubst pandoc/%.md,groff/%,$(sources_man7))

.PHONY: debug-artifacts
debug-artifacts:
	$(info Artifacts:)
	$(info - objects_man1: $(objects_man1))
	$(info - objects_man7: $(objects_man7))
	@:

### Paths

prefix ?= /usr/local
datarootdir := $(prefix)/share

.PHONY: debug-paths
debug-paths:
	$(info Paths:)
	$(info - datarootdir: $(datarootdir))
	$(info - mandir: $(mandir))
	$(info - man1dir: $(man1dir))
	$(info - man7dir: $(man7dir))
	$(info - prefix: $(prefix))
	@:

## Programs

FSWATCH ?= fswatch

INSTALL := install
INSTALLFLAGS := -g 0 -o 0

MANDOC ?= mandoc
PANDOC ?= pandoc
PANDOCFLAGS := -f markdown+definition_lists+line_blocks

.PHONY: debug-programs
debug-programs:
	$(info Programs:)
	$(info - FSWATCH: $(FSWATCH))
	$(info - INSTALL: $(INSTALL))
	$(info - INSTALLFLAGS: $(INSTALLFLAGS))
	$(info - MANDOC: $(MANDOC))
	$(info - PANDOC: $(PANDOC))
	$(info - PANDOCFLAGS: $(PANDOCFLAGS))
	@:

#. GROFF MANUAL TARGETS

.PHONY: preview
preview: #> Render manuals without building or installing
	$(PANDOC) $(sources) $(PANDOCFLAGS) -s -t man \
		| $(MANDOC)

.PHONY: watch
watch: #> Emit rendered manuals when Pandoc sources change
	$(FSWATCH) $(sources) \
		| xargs -I {} echo "$(PANDOC) {} $(PANDOCFLAGS) -s -t man | $(MANDOC)" \
		| sh

groff:
	mkdir -p $@

groff/%: pandoc/%.md | groff
	$(PANDOC) $< $(PANDOCFLAGS) -o $@ -s -t man

#. STANDARD TARGETS

groff_manual_installed := $(wildcard $(man1dir)/sode* $(man7dir)/sode*)

.PHONY: all
all: $(objects_man1) $(objects_man7) #> Build manuals
	@:

.PHONY: clean
clean: #> Remove local build files
	$(RM) groff/**

.PHONY: install
install: $(objects_man1) $(objects_man7) | $(man1dir) $(man7dir) #> Install manuals to $(mandir)
	install -g 0 -o 0 -m 0644 $(objects_man1) $(man1dir)
	install -g 0 -o 0 -m 0644 $(objects_man7) $(man7dir)

.PHONY: test
test:
	@:

.PHONY: uninstall
uninstall: #> Uninstall manuals
	$(RM) $(groff_manual_installed)

#. SUPPORT TARGETS

.PHONY: debug
.NOTPARALLEL: debug
debug: _debug-prefix debug-artifacts debug-paths debug-programs debug-sources #> Show debugging information
	@:

.PHONY: _debug-prefix
_debug-prefix:
	$(info ==Manuals==)
	@:

.PHONY: install-assets
install-assets:
	@:

.PHONY: install-tools
install-tools:
	@:
