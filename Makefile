TEX_FILES := $(wildcard book/*.tex)
all: reconstructing_ruby.pdf
	open reconstructing_ruby.pdf

reconstructing_ruby.pdf: $(TEX_FILES)
	pdflatex book/reconstructing_ruby.tex

markdown: $(TEXT_FILES)
	pandoc -s book/reconstructing_ruby.tex -o reconstructing_ruby.md

clean:
	rm reconstructing_ruby.*
