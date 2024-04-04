%{
    #include<stdio.h>
%}

%option noyywrap

%%
[a-zA-Z]+ing {printf("%s is verb (present participle)\n",yytext);}
[a-zA-Z]+ed {printf("%s is verb (past participle)\n",yytext);}
[a-zA-Z]+s {printf("%s is verb (present participle)\n",yytext);}
[a-zA-Z]+ly {printf("%s is adverb\n",yytext);}
[a-zA-Z]+ {printf("%s is adjective\n",yytext);}
. ;
%%

int main(int argc, char *argv[]){
    FILE *input;
    if(argc!=2){
        return 1;
    }
    input = fopen(argv[1],"r");
    yyin = input;
    if(!input){
        return 1;
    }
    yylex();
    fclose(input);
    return 0;
}
