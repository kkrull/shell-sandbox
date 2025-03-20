#. ==Manuals==

# Guide: https://eddieantonio.ca/blog/2015/12/18/authoring-manpages-in-markdown-with-pandoc/
# man-pages conventions: https://linux.die.net/man/7/man-pages

.PHONY: default
default: all

include ../../make.d/help.mk

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

### Paths

prefix ?= /usr/local
datarootdir := $(prefix)/share
mandir := $(datarootdir)/man

man1dir := $(mandir)/man1
$(man1dir):
	mkdir -p $@

man7dir := $(mandir)/man7
$(man7dir):
	mkdir -p $@

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

PANDOC ?= pandoc
PANDOCFLAGS := -f markdown+definition_lists+line_blocks

#. GROFF MANUAL TARGETS

FSWATCH ?= fswatch
MANDOC ?= mandoc

groff_manual_installed := $(wildcard $(man1dir)/marmot* $(man7dir)/marmot*)
groff_man1_objects := $(patsubst pandoc/%.md,groff/%,$(sources_man1))
groff_man7_objects := $(patsubst pandoc/%.md,groff/%,$(sources_man7))

.PHONY: debug-groff-manual
debug-groff-manual:
	$(info Groff Manual:)
	$(info - groff_man1_objects: $(groff_man1_objects))
	$(info - groff_man7_objects: $(groff_man7_objects))
	$(info - groff_manual_installed: $(groff_manual_installed))
	@:

.PHONY: groff-manual
groff-manual: $(groff_man1_objects) $(groff_man7_objects) #> Build man pages

.PHONY: groff-manual-clean
groff-manual-clean: #> Remove built man pages
	$(RM) groff/**

.PHONY: groff-manual-install
groff-manual-install: $(groff_man1_objects) $(groff_man7_objects) | $(man1dir) $(man7dir) #> Install man pages
	install -g 0 -o 0 -m 0644 $(groff_man1_objects) $(man1dir)
	install -g 0 -o 0 -m 0644 $(groff_man7_objects) $(man7dir)

.PHONY: groff-manual-preview
groff-manual-preview: #> Render man pages without building or installing
	$(PANDOC) $(sources) $(PANDOCFLAGS) -s -t man \
		| $(MANDOC)

.PHONY: groff-manual-uninstall
groff-manual-uninstall: #> Uninstall man pages
	$(RM) $(groff_manual_installed)

.PHONY: groff-manual-watch
groff-manual-watch: #> Emit rendered man pages when Pandoc sources change
	$(FSWATCH) $(sources) \
		| xargs -I {} echo "$(PANDOC) {} $(PANDOCFLAGS) -s -t man | $(MANDOC)" \
		| sh

groff:
	mkdir -p $@

groff/%: pandoc/%.md | groff
	$(PANDOC) $< $(PANDOCFLAGS) -o $@ -s -t man

#. STANDARD TARGETS

.PHONY: all
all: groff-manual #> Build all manuals
	@:

.PHONY: clean
clean: groff-manual-clean #> Remove local build files
	@:

.PHONY: install
install: groff-manual-install #> Install man pages to $(mandir)
	@:

.PHONY: test
test:
	@:

.PHONY: uninstall
uninstall: groff-manual-uninstall #> Uninstall man pages
	@:

#. SUPPORT TARGETS

.PHONY: debug
.NOTPARALLEL: debug
debug: debug-paths debug-sources debug-groff-manual #> Show debugging information
	@:

.PHONY: install-tools
install-tools:
	@:
