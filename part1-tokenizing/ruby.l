%{
#include <stdlib.h>
#include <stdio.h>
extern FILE* yyin;
#define TYPE(str) printf("%s\n", str)
#define VTYPE(str, type) printf("%s(%s)\n", str, type)
%}

%option noyywrap

%%
exit { exit(0); }
[ \t\n] ;
\".*\" { VTYPE("STRING", yytext); }
"=" { TYPE("EQUAL"); }
"+" { TYPE("PLUS"); }
"-" { TYPE("MINUS"); }
"*" { TYPE("MULT"); }
"/" { TYPE("DIV"); }
"(" { TYPE("LPAREN"); }
")" { TYPE("RPAREN"); }
"{" { TYPE("LBRACE"); }
"}" { TYPE("RBRACE"); }
"#" { TYPE("POUND"); }
"@" { TYPE("AT"); }
\" { TYPE("QUOTE"); }
"." { TYPE("DOT"); }
[a-z]+ { VTYPE("ID", yytext); }
[A-Z][A-Za-z0-9_]+ { VTYPE("CONSTANT", yytext); }
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
