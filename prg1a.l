%{
#include<stdio.h>
int op=0,dig=0;    
%}
%%
[0-9]+ {dig++;printf("\n Identifier");ECHO;}
[*+] {op++;printf("\n operator");ECHO;}
%%

int main()
{
    printf("Enter Expression :");
    yylex();
    printf("No of Identifiers = %d \nNo of operators = %d \n",dig,op);
}