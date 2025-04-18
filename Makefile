SHELL := /bin/bash

MD_FILES := $(wildcard cv_*.md)
TEX_FILES := $(MD_FILES:.md=.tex)
PDF_FILES := $(MD_FILES:.md=.pdf)
TEMPLATE ?= template

all: $(TEX_FILES) $(PDF_FILES)

cv_%.pdf: cv_%.md $(TEMPLATE).tex
	pandoc --from markdown --to pdf --template $(TEMPLATE).tex --output $@ $<

cv_%.tex: cv_%.md $(TEMPLATE).tex
	pandoc --from markdown --to latex --template $(TEMPLATE).tex --output $@ $<

.PHONY: clean
clean:
	-rm $(TEX_FILES) $(PDF_FILES)

.PHONY: watch
watch:
	inotifywait . -mr -e close_write --format '%w%f' | \
	while read -r closed_file; do \
		if [[ "$${closed_file}" =~ ($(TEMPLATE)\.tex|(.*\.md))$$ ]]; then \
			echo "Build triggered by '$$closed_file'."; \
			make; \
		fi \
	done
