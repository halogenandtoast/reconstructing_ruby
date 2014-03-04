all: rebuilding_ruby.pdf
	open rebuilding_ruby.pdf

rebuilding_ruby.pdf: rebuilding_ruby.tex
	pdflatex rebuilding_ruby.tex
