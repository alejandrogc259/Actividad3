#Félix Expósito Durán y Alejandro Guerra Cortés
run : actividad3
	./actividad3 entrada2.txt salidaActividad.txt
actividad3 : lex.yy.c estructura.cpp
	g++ -oactividad3 lex.yy.c estructura.cpp

lex.yy.c : actividad3.l
	flex  actividad3.l
clean :
	rm -f *.o *.c
