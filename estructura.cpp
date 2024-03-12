#include "estructura.h"
map<string, int> mapa;
void insertar(const char* clave, int valor){
    if(mapa.count(clave)==0)mapa[clave]=valor;
}
int valor(const char* clave){
    return mapa[clave];
}
void imprimir(){
    sort(mapa);
    
}
void sort(map<string, int>& M) 
{ 
 
    vector<pair<string, int> > A; 
 
    for (auto& it : M) { 
        A.push_back(it); 
    } 
 
    sort(A.begin(), A.end(), cmp); 
    for (auto& it : A) { 
 
        cout <<  '\t' << it.first << '\t'
            << it.second << endl; 
    }  
}
bool cmp(pair<string, int>& a, 
        pair<string, int>& b) 
{ 
    return a.second < b.second; 
}  