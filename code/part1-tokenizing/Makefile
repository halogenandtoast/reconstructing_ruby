all: main

main: main.c
	cc main.c -o main

main.c: ruby.l
	lex -o main.c ruby.l
