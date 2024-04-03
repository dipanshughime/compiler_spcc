%option noyywrap
%{
#include <stdio.h> 
int word_count = 0; 
int char_count = 0; 
int line_count = 0;
%}

%%
\n      { line_count++; }
[^\n]    { char_count++; }
[^ \t\n]+  { word_count++; }
%%

int main() {
char input[1000];
printf("Enter text (press Ctrl+D or Ctrl+Z to end):\n"); while (fgets(input, sizeof(input), stdin) != NULL) {
yy_scan_string(input);
yylex(); }
printf("Words: %d\nCharacters: %d\nLines: %d\n", word_count, char_count, line_count);
return 0; }
