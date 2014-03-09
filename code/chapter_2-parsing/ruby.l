%{
#include <stdlib.h>
#include <stdio.h>
#include "y.tab.h"
extern FILE* yyin;
%}

%option noyywrap
%option yylineno

%%
"class" { return CLASS; }
"def" { return DEF; }
"end" { return END; }

[ \t] ;
[\n] { return NEWLINE; }
\".*\" { yylval.string = strdup(yytext); return STRING; }
"=" { return EQUAL; }
"+" { return PLUS; }
"-" { return MINUS; }
"*" { return MULT; }
"/" { return DIV; }
"(" { return LPAREN; }
")" { return RPAREN; }
"{" { return LBRACE; }
"}" { return RBRACE; }
"#" { return POUND; }
"@" { return AT; }
"." { return DOT; }
"," { return COMMA; }
[A-Za-z][A-Za-z0-9_]+ { yylval.string = strdup(yytext); return ID; }
[0-9]+ { yylval.integer = atoi(yytext); return NUMBER; }
. { fprintf(stderr, "\nUnknown token: %s\n", yytext); }
%%

int main(int argc, char *argv[]) {
  if (argc > 1) {
    yyin = fopen(argv[1], "r");
  }
  yyparse();
  return EXIT_SUCCESS;
}
