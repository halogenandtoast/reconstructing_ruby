all: rebuilding_ruby.pdf
	open rebuilding_ruby.pdf

rebuilding_ruby.pdf: rebuilding_ruby.tex chapter_1.tex chapter_2.tex preface.tex
	pdflatex rebuilding_ruby.tex

markdown: rebuilding_ruby.tex
	pandoc -s rebuilding_ruby.tex -o rebuilding_ruby.md
