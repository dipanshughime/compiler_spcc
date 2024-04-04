%{
#include <stdio.h>
int vowel_count = 0;
int consonant_count = 0;
%}

%option noyywrap

%%
[aAeEiIoOuU]    { vowel_count++; }
[a-zA-Z]        { consonant_count++; }
.               ; /* ignore all other characters */
%%

int main() {
    yylex();
    printf("Number of vowels: %d\n", vowel_count);
    printf("Number of consonants: %d\n", consonant_count);
    return 0;
}
