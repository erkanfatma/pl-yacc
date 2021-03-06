# Programming Languages ft

Group Members: Fatma Erkan, Tuğba Güler

pl-yacc-starter-kit This is a logic language which allows only conjunction and printing the result.

# Explanations about the language

ftlang is a fairly simple language and was developed for mathematical operations. You can easily perform arithmatic operations, write an if-else and while loop, and define a method.  It has a basic structure that shows you your error when you get an error.

NOTE:  
We encountered many errors while developing ftlang programming language. And it took us a long time to resolve these errors. That's why we focused on keeping this language as simple as possible and the way it works. Although we can define the method while the arithmetic operations, if-else and while loop work smoothly, we cannot get the output.

# Syntax

Types

-primitive type- ::= -numeric type- | any

Blocks and Commands

-while statement- ::= while ( -expression- ) -statement-

-if then statement-::= if ( -expression- ) -statement-

-if then else statement-::= if ( -expression- ) -statement no short if- else -statement-

-if then else statement no short if- ::= if ( -expression- ) -statement no short if- else -statement no short if-


Expressions

-constant expression- ::= -expression-

-expression- ::= -assignment expression-

-assignment expression- ::= -conditional expression- | -assignment-

-assignment- ::= -left hand side- -assignment operator- -assignment expression-

-left hand side- ::= -expression name-

-assignment operator- ::= =

Tokens

-digit- ::= 0 | -non zero digit-

-non zero digit- ::= 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9

-sign- ::= + | -

New Lines and White Space

Operations

ADDITION: '+' ; SUBTRACTION: '-' ; MULTIPLICATION: '*' ; DIVISION: '/' ; 

AND: '&&' ; OR: '||' ; ASSIGNMENT: '==' ;


# HOW TO EXECUTE THIS PROGRAM?
Run Commands:

   yacc -d ftlang.y 

   lex ftlang.l 

   gcc lex.yy.c y.tab.c 

   ./a.out

# REFERENCES 

While doing homework, Thomas Niemann's A Guide To Lex & Yacc source was used.

Link to the source:

https://arcb.csc.ncsu.edu/~mueller/codeopt/codeopt00/y_man.pdf

http://www.cs.bilkent.edu.tr/~guvenir/courses/CS315/lex-yacc/lex-yacc.pdf