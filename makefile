#Executing

lex:
	lex ftlang.l 

yacc:
    yacc -d ftlang.y 

   gcc lex.yy.c y.tab.c 
   ./a.out


delete compiled lex and yacc: 
rm lex.yy.c y.tab.c y.tab.h a.out
