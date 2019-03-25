%{
#include<stdio.h>
#include<stdlib.h>
int id=0,dig=0,key=0,op=0;
extern FILE *yyin;
%}
%token DIGIT KEY OP ID
%%
input: DIGIT input{dig++;}
      | ID input{id++;}
      | KEY input{key++;}
      | OP input{op++;}
      | DIGIT {dig++;}
      | ID {id++;}
      | KEY {key++;}
      | OP {op++;}
%%

main()
{
    FILE *f1 = fopen("output.c","r");
    if(!f1)
        {
            printf("output.c doesn't exist");
            exit(0);
        }
        yyin = f1;
        do{
            yyparse();
        } while(!feof(yyin));
        printf("Number : %d \nKeyword : %d \nOperator : %d \nIdentifier : %d\n",
                dig,key,op,id);
}
void yyerror()
{
    printf("Error !!");
    exit(0);
}