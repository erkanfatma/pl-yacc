#Executing

lex:
	lex ftlang.l 

yacc:
    yacc -d ftlang.y 

   gcc lex.yy.c y.tab.c 
   ./a.out