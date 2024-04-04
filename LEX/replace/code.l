%{
#include <stdio.h>
#include <stdlib.h>
%}

%%
"printf"    { fprintf(yyout, "write"); }
"scanf"     { fprintf(yyout, "readf"); }
.           { fprintf(yyout, "%s", yytext); }
%%

int main(int argc, char* argv[]) {
    if (argc != 3) {
        printf("Usage: %s input_file output_file\n", argv[0]);
        return 1;
    }

    FILE* input_file = fopen(argv[1], "r");
    if (!input_file) {
        printf("Error: Couldn't open input file\n");
        return 1;
    }

    FILE* output_file = fopen(argv[2], "w");
    if (!output_file) {
        printf("Error: Couldn't create output file\n");
        fclose(input_file);
        return 1;
    }

    yyin = input_file;
    yyout = output_file;

    yylex();

    fclose(input_file);
    fclose(output_file);

    return 0;
}
int yywrap() {
    return 1;
}
