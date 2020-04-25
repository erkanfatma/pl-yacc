 
%%
elseif                 printf("ELSEIF\n");
if                     printf("IF\n");
else                   printf("ELSE\n");
then                   printf("THEN\n");
while                  printf("WHILE LOOP\n");
dowhile                printf("DO-WHILE\n");
for                    printf("FOR LOOP\n");
\^                     printf("COMMENT\n");
print                  printf("PRINT\n");

true|false             printf("BOOLEAN\n");
[0-9]*                 printf("INTEGER\n");
[0-9]*\.[0-9]*         printf("FLOAT\n");
[a-zA-Z][_a-zA-Z0-9]*  printf("IDENTIFIER\n");     
\+                     printf("ADDITION\n");
\-                     printf("SUBSTRACTION\n");
\*                     printf("MULTIPLICATION\n");
\&                     printf("AND OPERATOR\n");
\|                     printf("OR OPERATOR\n");
\/                     printf("DIVISION\n");
\%                     printf("MODULUS\n");
\<=                    printf("LESSTHAN OR EQUALS\n");
\<                     printf("LESSTHAN\n");
\>=                    printf("GREATERTHAN OR EQUALS\n");
\>                     printf("GREATERTHAN\n");
=                      printf("EQUAL\n");
:                      printf("COLON\n");
;                      printf("SEMICOLON\n");


%%