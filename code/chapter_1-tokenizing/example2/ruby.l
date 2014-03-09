%{
#include <stdlib.h>
#include <stdio.h>
extern FILE* yyin;
%}

%option noyywrap

%%
[0-9]+ { printf("NUMBER: %s", yytext); }
. { }
%%

int main(int argc, char *argv[]) {
  if (argc > 1) {
    yyin = fopen(argv[1], "r");
  }
  yylex();
  return EXIT_SUCCESS;
}
