%{
#include <stdio.h>
%}

%token NUMBER
%left '+' '-'
%left '*' '/'

%%

calc: expr '\n'     { printf("Result: %d\n", $1); }
    ;

expr: expr '+' expr  { $$ = $1 + $3; }
    | expr '-' expr  { $$ = $1 - $3; }
    | expr '*' expr  { $$ = $1 * $3; }
    | expr '/' expr  { if ($3 != 0) $$ = $1 / $3; else yyerror("Division by zero"); }
    | '(' expr ')'   { $$ = $2; }
    | NUMBER         { $$ = $1; }
    ;

%%

int yyerror(const char *s) {
    printf("Error: %s\n", s);
    return 0;
}

int main() {
    yyparse();
    return 0;
}

