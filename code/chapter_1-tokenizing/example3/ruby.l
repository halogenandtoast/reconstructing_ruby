%{
#include <stdlib.h>
#include <stdio.h>
extern FILE* yyin;
#define VTYPE(str, type) printf("%s(%s)\n", str, type)
%}

%option noyywrap

%%
[0-9]+ { VTYPE("NUMBER", yytext); }
. { fprintf(stderr, "\nUnknown token: %s\n", yytext); }
%%

int main(int argc, char *argv[]) {
  if (argc > 1) {
    yyin = fopen(argv[1], "r");
  }
  yylex();
  return EXIT_SUCCESS;
}
