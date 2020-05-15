%{ 

        /* FIRST SECTION */

    /* To catch syntactical error occurs */
    void yyerror(char *s);

    /* C declerations */
    #include <stdio.h>
    #include <stdlib.h>
    
    /* Primitive symbol table implementation */
    int symbol[52];  /* 52 different variables. a-z and A-Z  */

    /* To check if the symbol is exist in the table */
    /* Reads a value returns it to client  */
    int symbolVal(char symbol);

    /* Gets the value that is passing */
    /* Update the symbol table with that value  */
    void updateSymbolVal(char symbol, int val);

    /* Yacc definitions*/
    %union {int num; char id;}  /* To specify different types that lex analyser return */
    %start line   /* indicate which of the production that follow in the middle section is to be starting rule */
    %token print  /* token type is print (token that is expected from lexical analyser and refer to that token type is print)  */
    %token exit_command  /* lex analyser reference these values in the header file which is generated when yacc file is compiled */
    %token <num> number  /* <num> to store in the member of num in the union type */
    %token <id> identifier  /* when any identifier is seen it is going to get returned by the lex analysis in the member variable ID in the union */
    /* assigning types to the non terminals which appear on the left hand side of the grammar */
    %type <num> line exp term /* map to the type num(int)   */
    %type <id> assignment /* map identifier an ID */


        /* SECOND SECTION */
    
    /* description of expected inputs  */  /* corresponding actions in C */

    line : assignment ';'           {;}
         | exit_command ';'         {exit(EXIT_SUCCESS);}
         | print exp ';'            {printf("Printing %d\n", $2);}

        /* THIRD SECTION */

        
}