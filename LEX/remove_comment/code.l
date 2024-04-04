%{
   #include<stdio.h>
   #include<stdlib.h>
   #include<string.h>
   int comments=0;
%}
%%
"/*"(.|\n)*?"*/"   { comments++; }
 "//".*          { comments++; } 
%%
int main() {
    yyin=fopen("input.c", "r");
    yyout=fopen("result.c", "w");
    yylex();
    printf("Number of comments removed: %d", comments);
    return 0;
}
int yywrap() {
return 1; }