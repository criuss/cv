all: example.pdf example.tex

example.pdf: example.md template.tex
	pandoc --from markdown --to pdf --template template.tex --output $@ $<

example.tex: example.md template.tex
	pandoc --from markdown --to latex --template template.tex --output $@ $<
