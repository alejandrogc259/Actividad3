#Félix Tragapollas Tambiénlegustaelanal Alejandro Guerra Cortés
run : actividad3
	./actividad3 < entrada1.txt > salidaActividad.txt
actividad3 : lex.yy.c
	g++ -oactividad3 lex.yy.c

lex.yy.c : actividad3.l
	flex  actividad3.l
clean :
	rm -f *.o *.c
