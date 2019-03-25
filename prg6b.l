%{
#include<stdio.h>
#include "y.tab.h"
extern yylval;
%}
%%
[+|-|*|/|=|<|>] {printf("operator is %s \n", yytext); return OP;}
[0-9]+ {yylval =atoi(yytext); printf("Number is : %d \n",yylval);return DIGIT;}
int|char|boo|float|void|for|do|while|include|if|else|return {printf("Keyword is %s \n",yytext); return KEY;}
[a-zA-Z0-9]+ {printf("Identifier is %s \n",yytext); return ID;}
. ;
%%