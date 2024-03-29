%{
#include<stdio.h>
int count=0;
%}
%%
"/*[^*/]* */" {count++;}
"//".* {count++;}
%%
int main(int argc, char **argv)
{
    FILE *f1,*f2;
    if(argc>1)
    {
        f1=fopen(argv[1],"r");
        if(!f1)
        {
            printf("File Error");
            exit(0);
        }
        yyin = f1;
        f2 = fopen(argv[2], "w");
        if (!f2)
        {
            printf("File Error");
            exit(0);
        }
        yyout = f2;
        yylex();
        printf("Number of comment lines = %d \n",count);
    }
    return 0;
}