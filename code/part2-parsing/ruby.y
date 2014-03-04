%{
#include <stdio.h>
int yydebug = 1;
extern int yylineno;
int yylex(void);
void yyerror(const char *s) {
  fprintf(stderr, "Shit went down: %s; line: %d", s, yylineno);
}
%}

%token CLASS END DEF LPAREN RPAREN EQUAL ID AT DOT COMMA STRING PLUS MULT DIV MINUS
%token LBRACE RBRACE POUND NUMBER NEWLINE

%right EQUAL

%union {
  char* string;
  int integer;
}

%error-verbose

%start program

%%

program: top_compstmt
       ;

top_compstmt: top_stmts opt_terms
            ;

top_stmts:
         | top_stmt
         | top_stmts terms top_stmt
         ;

top_stmt: stmts

stmts:
          | stmt
          | stmts terms stmt
          ;

stmt: expr
    |
    ;

expr: arg
    ;

arg: lhs EQUAL arg
   | primary
   ;

primary: variable
       | CLASS cpath bodystmt END
       | DEF fname f_arglist bodystmt END
       ;

lhs: variable
   ;

fname: ID
     ;


f_arglist: LPAREN f_args RPAREN
       | f_args term
       ;

f_args : f_arg opt_args_tail
       | args_tail
       |
       ;

f_arg: f_arg_item
     | f_arg COMMA f_arg_item

f_arg_item: f_norm_arg
          | LPAREN f_margs RPAREN
          ;

f_margs: f_marglist

variable: varname
        ;

varname: AT ID
       | ID
       ;

term: NEWLINE
    ;

opt_term: term
        |
        ;
