#. ==(Brode)sode==

.PHONY: default
default: all

include ../../../make.d/help.mk ../../../make.d/paths-system.mk

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

.PHONY: debug-paths
debug-paths:
	$(info Paths:)
	$(info - bindir: $(bindir))
	$(info - datadirpkg: $(datadirpkg))
	$(info - libexecdirpkg: $(libexecdirpkg))
	@:

## Programs

INSTALL := install
INSTALLFLAGS := -g 0 -o 0

.PHONY: debug-programs
debug-programs:
	$(info Programs:)
	$(info - INSTALL: $(INSTALL))
	$(info - INSTALLFLAGS: $(INSTALLFLAGS))
	@:

#. STANDARD TARGETS

.NOTPARALLEL: all
.PHONY: all
all:
	@:

.PHONY: clean
clean:
	@:

.PHONY: install
install: install-bins install-datadirpkg install-executable install-libs #> Install program and links
	$(INSTALL) $(INSTALLFLAGS) -d $(bindir)
	$(INSTALL) $(INSTALLFLAGS) -l as -m 0755 $(libexecdirpkg)/$(executable) $(bindir)/sode

.PHONY: install-bins
install-bins:
	$(INSTALL) $(INSTALLFLAGS) -d $(libexecdirpkg)/bin
	$(INSTALL) $(INSTALLFLAGS) -m 0755 $(source_bins) $(libexecdirpkg)/bin

.PHONY: install-datadirpkg
install-datadirpkg:
	$(INSTALL) $(INSTALLFLAGS) -d $(datadirpkg)
	$(INSTALL) $(INSTALLFLAGS) -m 0644 $(source_version) $(datadirpkg)

.PHONY: install-executable
install-executable: $(executable)
	$(INSTALL) $(INSTALLFLAGS) -d $(libexecdirpkg)
	$(INSTALL) $(INSTALLFLAGS) -m 0755 $(executable) $(libexecdirpkg)
	$(INSTALL) $(INSTALLFLAGS) -m 0644 $(source_version) $(libexecdirpkg)

.PHONY: install-libs
install-libs:
	$(INSTALL) $(INSTALLFLAGS) -d $(libexecdirpkg)/lib
	$(INSTALL) $(INSTALLFLAGS) -m 0644 $(source_libs) $(libexecdirpkg)/lib

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
