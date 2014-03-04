all: main

main: main.c y.tab.c
	cc y.tab.c main.c -o main

debug: main.c y.tab.debug.c
	cc y.tab.debug.c main.c -o main

main.c: ruby.l
	lex -o main.c ruby.l

y.tab.c: ruby.y
	yacc -d ruby.y

y.tab.debug.c: ruby.y
	yacc --debug --verbose -o y.tab.debug.c ruby.y
