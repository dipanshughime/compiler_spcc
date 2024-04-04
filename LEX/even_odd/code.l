%{
#include<stdio.h> 

%}

%%
[0-9]+ {
    int num = atoi(yytext);
    if (num % 2 == 0) {
        printf("%d is an even integer.\n", num);
    } else {
        printf("%d is an odd integer.\n", num);
    }
}
%%

int main(int argc,char* argv[]) {
    printf("Enter the number stream");
    
    s = fopen(argv[1], "r");
    if (!input_file) {
        printf("Error: Couldn't open input file\n");
        return 1;
    }

    yyin = input_file;

    yylex();
    fclose(input_file);

    return 0;

}
int yywrap(){
    return 1;
}
