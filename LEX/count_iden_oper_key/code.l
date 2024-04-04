
%{
#include<stdio.h>
int keyword_count = 0;
int identifier_count = 0;
int operator_count = 0;
%}

%option noyywrap

%%
if|else|while|for|int|float|char { keyword_count++; }
[a-zA-Z0-9]*       { identifier_count++; }
[-+*/=<>!&|^%]                   { operator_count++; }
[ \t\n]                          ; /* skip whitespace and newline */
.                                ; /* skip unrecognized characters */

%%

int main(int argc, char *argv[]) {
    FILE *input_file;
    if (argc != 2) {
        printf("Usage: %s input_file\n", argv[0]);
        return 1; 
    }
    
    input_file = fopen(argv[1], "r");
    if (!input_file) {
        printf("Error: Unable to open input file.\n");
        return 1;
    }
    
    yyin = input_file;
    
    yylex();
    
    fclose(input_file);
    
    printf("Number of keywords: %d\n", keyword_count);
    printf("Number of identifiers: %d\n", identifier_count);
    printf("Number of operators: %d\n", operator_count);
    
    return 0;
}
