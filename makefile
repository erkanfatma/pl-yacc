
ftlang: ftlang.l
	lex ftlang.l
	gcc -o ftlang lex.yy.c -ll

clean:
	rm ftlang lex.yy.c

test:
	./ftlang < test.ft