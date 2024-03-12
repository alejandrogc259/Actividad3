%{
#include <iostream>
#include <string>
#include <map>
using namespace std;
int lineas;
map<string, int> mapa;	
%}

float [0-9]+[.][0-9]*|[.][0-9]+
%option noyywrap
%x COM1 COM2


%%
"//"        BEGIN(COM1);
<COM1>"\n"  {BEGIN(0);printf("\n");lineas++;}
"/*"        BEGIN(COM2);
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
[A-Za-zñÑ_][A-Za-z0-9ñÑ_]*  {printf("ID"); if(mapa.count(yytext)==0)mapa[yytext]=lineas+1;}
[0-9]+                          {printf("ENTERO");} 
{float}([eE][+-]?[0-9]+)?  {printf("REAL");}
["][^"]*["]                     {printf("TEXTO");}
.                              {ECHO;}

%%
int main(){
    lineas = 0;
        
	yylex();
    printf("\n");
    printf("Lista de identificadores:\n\n");
    map<string, int>::iterator it = mapa.begin();
    while (it != mapa.end()) {
        cout << "\t" <<it->first
             << "\t" << it->second << endl;
        ++it;
    }
    printf("\nNúmero total de líneas del fichero de entrada: ");
    printf("%d",lineas);
	return 0;
}