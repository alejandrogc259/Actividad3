%{
#include <iostream>
#include <string>
#include "estructura.h"
using namespace std;
int lineas;
%}

float [0-9]+[.][0-9]*|[.][0-9]+
%option noyywrap
%x COM1 COM2


%%
"//"        BEGIN(COM1);
<COM1>"\n"  {BEGIN(0);printf("\n");lineas++;}
"/*"        BEGIN(COM2);
<COM2>"\n"  {lineas++;};
<COM2>"*/"   BEGIN(0);
<COM2>"*/""\n"  {BEGIN(0);lineas++;}
<COM1,COM2>.  ;

^[\t ]*[\n]                      {lineas++;}
\n                             {ECHO;lineas++;}
int                            {printf("INT");}
float                           {printf("FLOAT");}
return                          {printf("RETURN");}
for                             {printf("FOR");}
if                              {printf("IF");}
else                            {printf("ELSE");}
[A-Za-zñÑ_][A-Za-z0-9ñÑ_]*  {printf("ID"); insertar(yytext, lineas+1);}
[0-9]+                          {printf("ENTERO");} 
{float}([eE][+-]?[0-9]+)?  {printf("REAL");}
["][^"]*["]                     {printf("TEXTO");}
.                              {ECHO;}
<<EOF>>                         {return 0;}

%%
int main(int argc, char* argv[]){
    lineas = 0;
    if(argc > 1){
        yyin = fopen(argv[1], "r");
        yyout = freopen(argv[2], "w", stdout);
        yylex();
        printf("\n");
        printf("Lista de identificadores:\n\n");
        imprimir();
        printf("\nNúmero total de líneas del fichero de entrada: ");
        printf("%d",lineas);
        printf("\n");
    }
    else printf("Pocos argumentos");
        
	
	return 0;
}