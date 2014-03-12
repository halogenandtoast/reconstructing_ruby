%{
#include <stdlib.h>
#include <stdio.h>
extern FILE* yyin;
#define TYPE(str) printf("%s\n", str)
#define VTYPE(str, type) printf("%s(%s)\n", str, type)
%}

%option noyywrap

%%
[ \t\n] ;
[0-9]+((\.[0-9]+(e[+-]?[0-9]+)?)|(e[+-]?[0-9]+)) { VTYPE("FLOAT", yytext); }
[0-9]+ { VTYPE("NUMBER", yytext); }
\"([^"]|\\.)+\" { VTYPE("STRING", yytext); }
\’([^’]|\\.)+\’ { VTYPE("STRING", yytext); }
[A-Z][A-Za-z0-9_]* { VTYPE("CONSTANT", yytext); }
[a-z][A-Za-z0-9_]* { VTYPE("ID", yytext); }
">" { TYPE("GT"); }
"<" { TYPE("LT"); }
">=" { TYPE("GTE"); }
"<=" { TYPE("LTE"); }
"!=" { TYPE("NEQUAL"); }
"=" { TYPE("EQUAL"); }
"+" { TYPE("EQUAL"); }
"-" { TYPE("EQUAL"); }
"*" { TYPE("EQUAL"); }
"/" { TYPE("EQUAL"); }
"%" { TYPE("EQUAL"); }
"!" { TYPE("EQUAL"); }
"?" { TYPE("EQUAL"); }
"&" { TYPE("AND"); }
"|" { TYPE("OR"); }
"[" { TYPE("LSBRACE"); }
"]" { TYPE("RSBRACE"); }
"(" { TYPE("EQUAL"); }
")" { TYPE("EQUAL"); }
"{" { TYPE("EQUAL"); }
"}" { TYPE("EQUAL"); }
"#" { TYPE("EQUAL"); }
"@" { TYPE("EQUAL"); }
"." { TYPE("EQUAL"); }
"," { TYPE("EQUAL"); }
":" { TYPE("EQUAL"); }
. { fprintf(stderr, "\nUnknown token: %s\n", yytext); }
%%

int main(int argc, char *argv[]) {
  if (argc > 1) {
    yyin = fopen(argv[1], "r");
  }
  yylex();
  return EXIT_SUCCESS;
}
