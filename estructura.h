#include <map>
#include <string>
#include <iostream>
#include <vector>
#include <algorithm>
#ifndef ESTRUCTURA_H  
#define ESTRUCTURA_H
using namespace std;

extern map<string, int> mapa;
void insertar(const char* clave, int valor);  
int valor(const char* clave);
void imprimir();
bool cmp(pair<string, int>& a, pair<string, int>& b);
void sort(map<string, int>& M);
#endif