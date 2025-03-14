#. ==Scala Sandbox==

.PHONY: default
default: all

## Sources

## Artifacts

## Paths

## Programs

SBT := sbt

.PHONY: debug-programs
debug-programs:
	$(info Programs:)
	$(info - SBT: $(SBT))
	@:

## Project

# https://stackoverflow.com/a/17845120/112682
SUBDIRS := \
	programming-in-scala-2 \
	programming-in-scala-4 \
	sbt-by-example \
	scalatest-3

.PHONY: $(SUBDIRS)
$(SUBDIRS):
	$(MAKE) -C $@ $(MAKECMDGOALS)

.PHONY: debug-project
debug-project:
	$(info Project:)
	$(info - SUBDIRS: $(SUBDIRS))
	@:

#. PRE-COMMIT TARGETS

PRECOMMIT ?= pre-commit

.PHONY: pre-commit-gc
pre-commit-gc: #> Remove stale pre-commit files
	$(PRECOMMIT) gc

.PHONY: pre-commit-install
pre-commit-install: #> Install Git pre-commit hook
	$(PRECOMMIT) install

.PHONY: pre-commit-run
pre-commit-run: #> Run pre-commit on all sources
	$(PRECOMMIT) run --all-files

.PHONY: pre-commit-update
pre-commit-update: #> Update pre-commit plugins
	$(PRECOMMIT) autoupdate

#. SBT TARGETS

.PHONY: console
console: #> Start an interactive session of the scala interpreter
	$(SBT) --allow-empty -Dsbt.version=1.10.7 console

#. STANDARD TARGETS

.PHONY: all
all: $(SUBDIRS) #> Build all projects

.PHONY: clean
clean: pre-commit-gc $(SUBDIRS) #> Remove local build files

.PHONY: install
install: $(SUBDIRS)

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
	$(info ==Scala Sandbox==)
	@:

.PHONY: help
help: help-local $(SUBDIRS) #> Show this help

# https://stackoverflow.com/a/47107132/112682
.PHONY: help-local
help-local:
	@sed -n \
		-e '/@sed/!s/#[.] */_margin_\n/p' \
		-e '/@sed/!s/:.*#> /:/p' \
		$(MAKEFILE_LIST) \
	| column -ts : | sed -e 's/_margin_//'

.PHONY: install-assets
install-assets: $(SUBDIRS)

.PHONY: install-tools
install-tools: pre-commit-install $(SUBDIRS) #> Install development tools
