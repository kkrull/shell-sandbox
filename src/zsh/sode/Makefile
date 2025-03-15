#. ==(Brode)sode==

.PHONY: default
default: all

## Sources

# NB: the wildcard function is not recursive: https://stackoverflow.com/a/2483203/112682
source_bins := $(shell find bin -type f -name '*.zsh' | sort)
source_libs := $(shell find lib -type f -name '*.zsh' | sort)
source_main := sode.zsh
source_version := version
sources := $(shell find . -type f -name '*.zsh' | sort)

.PHONY: debug-sources
debug-sources:
	$(info Sources:)
	$(info - source_bins: $(source_bins))
	$(info - source_libs: $(source_libs))
	$(info - source_main: $(source_main))
	$(info - source_version: $(source_version))
	$(info - sources: $(sources))
	@:

## Artifacts

executable := sode.zsh

.PHONY: debug-artifacts
debug-artifacts:
	$(info Artifacts:)
	$(info - executable: $(executable))
	@:

## Paths

prefix ?= /usr/local
exec_prefix ?= $(prefix)

# Executable programs that users can run (including symlinks)
bindir := $(exec_prefix)/bin

# Executable programs to be run by other programs, in a subdirectory thereof
libexecdir := $(exec_prefix)/libexec
libexecdirpkg := $(libexecdir)/sode

# Read-only architecture-independent data files, in a subdirectory thereof
datarootdir := $(prefix)/share
datadir := $(datarootdir)
datadirpkg := $(datadir)/sode

.PHONY: debug-paths
debug-paths:
	$(info Paths:)
	$(info - bindir: $(bindir))
	$(info - datadir: $(datadir))
	$(info - datadirpkg: $(datadirpkg))
	$(info - datarootdir: $(datarootdir))
	$(info - exec_prefix: $(exec_prefix))
	$(info - libexecdir: $(libexecdir))
	$(info - libexecdirpkg: $(libexecdirpkg))
	$(info - prefix: $(prefix))
	@:

## Programs

INSTALLFLAGS := -g 0 -o 0

.PHONY: debug-programs
debug-programs:
	$(info Programs:)
	$(info - INSTALLFLAGS: $(INSTALLFLAGS))
	@:

#. STANDARD TARGETS

.NOTPARALLEL: all
.PHONY: all
all: #> Build all artifacts
	@:

.PHONY: clean
clean:
	@:

.PHONY: install
install: install-bins install-datadirpkg install-executable install-libs #> Install program and links
	install $(INSTALLFLAGS) -d $(bindir)
	ln -f -s $(libexecdirpkg)/$(executable) $(bindir)/sode

.PHONY: install-bins
install-bins:
	install $(INSTALLFLAGS) -d $(libexecdirpkg)/bin
	install $(INSTALLFLAGS) -m 0755 $(source_bins) $(libexecdirpkg)/bin

.PHONY: install-datadirpkg
install-datadirpkg:
	install $(INSTALLFLAGS) -d $(datadirpkg)
	install $(INSTALLFLAGS) -m 0644 $(source_version) $(datadirpkg)

.PHONY: install-executable
install-executable: $(executable)
	install $(INSTALLFLAGS) -d $(libexecdirpkg)
	install $(INSTALLFLAGS) -m 0755 $(executable) $(libexecdirpkg)

.PHONY: install-libs
install-libs:
	install $(INSTALLFLAGS) -d $(libexecdirpkg)/lib
	install $(INSTALLFLAGS) -m 0644 $(source_libs) $(libexecdirpkg)/lib

.PHONY: test
test:
	@:

.PHONY: uninstall
uninstall: #> Uninstall program
	$(RM) $(bindir)/sode
	$(RM) -R $(datadirpkg)
	$(RM) -R $(libexecdirpkg)

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

.PHONY: test-install
test-install: #> List installed files after running `make install`
	ls -l $(bindir)/sode
	find $(datadirpkg) -type f | sort
	find $(libexecdirpkg) -type f | sort
