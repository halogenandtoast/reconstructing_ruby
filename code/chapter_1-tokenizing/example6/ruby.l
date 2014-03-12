%{
#include <stdlib.h>
#include <stdio.h>
extern FILE* yyin;
#define VTYPE(str, type) printf("%s(%s)\n", str, type)
#define TYPE(type) printf("%s\n", type)
%}

%option noyywrap

%%
[0-9]+ { VTYPE("NUMBER", yytext); }
[0-9]+((\.[0-9]+(e[+-]?[0-9]+)?)|(e[+-]?[0-9]+)) { VTYPE("FLOAT", yytext); }
[a-z][a-zA-Z0-9_]* { VTYPE("ID", yytext); }
\"([^"]|\\.)+\" { VTYPE("STRING", yytext); }
= { TYPE("ASSIGN"); }
[\t\n ]
. { fprintf(stderr, "\nUnknown token: '%s'\n", yytext); }
%%

int main(int argc, char *argv[]) {
  if (argc > 1) {
    yyin = fopen(argv[1], "r");
  }
  yylex();
  return EXIT_SUCCESS;
}
