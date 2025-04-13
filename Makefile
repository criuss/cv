SHELL := /bin/bash

all: example.pdf example.tex

example.pdf: example.md template.tex
	pandoc --from markdown --to pdf --template template.tex --output $@ $<

example.tex: example.md template.tex
	pandoc --from markdown --to latex --template template.tex --output $@ $<

# filename=example template=template_photo make mdToPDF
mdToPDF:
	pandoc --from markdown --to latex --template "$(template).tex" --output "$(filename).pdf" "$(filename).md"

.PHONY: watch
watch:
	inotifywait . -mr -e close_write --format '%w%f' | \
	while read -r closed_file; do \
		if [[ "$${closed_file}" =~ (template\.tex|(.*\.md))$$ ]]; then \
			echo "Build triggered by '$$closed_file'."; \
			make; \
		fi \
	done
