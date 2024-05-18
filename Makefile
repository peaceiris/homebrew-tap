.DEFAULT_GOAL := help

.PHONY: help		# show help
help:
	@grep "^.PHONY:" $(MAKEFILE_LIST) | sed 's/\.PHONY: //g' | sed 's/ #/\t#/'

.PHONY: shellcheck # lint for all shell scripts
shellcheck:
	shellcheck $$(find . -name "*.sh" -not -path "./node_modules/*")


.PHONY: shellcheck-fix # lint for all shell scripts and apply suggested fixes
shellcheck-fix:
	shellcheck -f diff $$(find . -name "*.sh" -not -path "./node_modules/*") | git apply --unsafe-paths
