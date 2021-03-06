%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <stdarg.h>
    #include <string.h>
    #include <ctype.h>
    #include "ftlang.h"
    #include "y.tab.h"
    #include "errmsg.h"

    nodeType *opr(int oper, int nops, ...);
    nodeType *id(int i);
    nodeType *con(int value);
    void freeNode(nodeType *p);
    int ex(nodeType *p);
    int yylex(void);
    void yyerror(char *s);
    int sym[26];                    
%}

%union {
    int iValue;                 
    char sIndex; 
    char c[30];            
    nodeType *nPtr;     
    struct symtab *symp;        
};

%token <iValue> INTEGER
%token <sIndex> VARIABLE
%token <c> IDENT 
%token WHILE IF PRINT 
%token TYPE_CHAR TYPE_INT 
%token COMMENT RETURN STRUCT MAIN_METHOD METHOD EXIT

%nonassoc IFX
%nonassoc ELSE

%left GE LE EQ NE '>' '<'
%left '+' '-'
%left '*' '/'
%nonassoc UMINUS

%type <nPtr> stmt expr stmt_list 
%type <iValue> TYPE_INT
%type <sIndex> TYPE_CHAR

%%

program:
        function                        {exit(0);}
        | method                        {exit(0);}
        | program function_definition 
        | function_definition
        ;

method:
          MAIN_METHOD '(' ')' stmt                       
        | TYPE_INT METHOD '(' TYPE_INT VARIABLE')' stmt  
        
        ;

function:
        function stmt                   {ex($2); freeNode($2);}
        |
        ;

function_definition: 
        var_def args '{' stmt '}'
        ;

args: 
        '(' var_def_list ')'
        ;

var_def_list:
         var_def ',' var_def
        |var_def 
        | var_def var_def  {yyerror("Multiple variable definitions must contain a comma between them.");}
        ;

var_def:
        TYPE_INT IDENT
        ;

stmt:
          ';'                            { $$ = opr(';', 2, NULL, NULL); }
        | expr ';'                       { $$ = $1; }
        | PRINT expr ';'                 { $$ = opr(PRINT, 1, $2); }
        | RETURN expr                    { $$ = opr(RETURN, 1, $2); }        
        | VARIABLE '=' expr ';'          { $$ = opr('=', 2, id($1), $3); }
        | WHILE '(' expr ')' stmt        { $$ = opr(WHILE, 2, $3, $5); } 
        | IF '(' expr ')' stmt %prec IFX { $$ = opr(IF, 2, $3, $5); }
        | IF '(' expr ')' stmt ELSE stmt { $$ = opr(IF, 3, $3, $5, $7); }
        | '{' stmt_list '}'              { $$ = $2; }
        | RETURN                         {yyerror("return needs an axpression.");}
        | WHILE expr stmt                {yyerror("Parenthesis missing."); } 
        | IF expr stmt %prec IFX         {yyerror("Paranthesis missing."); }
        | IF expr stmt ELSE stmt         {yyerror("Paranthesis missing.");}
        | EXIT							 {exit(EXIT_SUCCESS);}
        ;

stmt_list:
          stmt                          { $$ = $1; }
        | stmt_list stmt                { $$ = opr(';', 2, $1, $2); }
        ;

expr:
        INTEGER                         { $$ = con($1); }
        | VARIABLE                      { $$ = id($1); }
        | '-' expr %prec UMINUS         { $$ = opr(UMINUS, 1, $2); }
        | expr '+' expr                 { $$ = opr('+', 2, $1, $3); }
        | expr '-' expr                 { $$ = opr('-', 2, $1, $3); }
        | expr '*' expr                 { $$ = opr('*', 2, $1, $3); }
        | expr '/' expr                 { $$ = opr('/', 2, $1, $3); }
        | expr '<' expr                 { $$ = opr('<', 2, $1, $3); }
        | expr '>' expr                 { $$ = opr('>', 2, $1, $3); }
        | expr GE expr                  { $$ = opr(GE, 2, $1, $3); }
        | expr LE expr                  { $$ = opr(LE, 2, $1, $3); }
        | expr NE expr                  { $$ = opr(NE, 2, $1, $3); }
        | expr EQ expr                  { $$ = opr(EQ, 2, $1, $3); }
        | '(' expr ')'                  { $$ = $2; }
        ;

%%

nodeType *con(int value) {
    nodeType *p;


    if ((p = malloc(sizeof(nodeType))) == NULL)
        yyerror("Out of memory");

    p->type = typeCon;
    p->con.value = value;

    return p;
}

nodeType *id(int i) {
    nodeType *p;


    if ((p = malloc(sizeof(nodeType))) == NULL)
        yyerror("Out of memory");

    p->type = typeId;
    p->id.i = i;

    return p;
}

nodeType *opr(int oper, int nops, ...) {
    va_list ap;
    nodeType *p;
    int i;

    if ((p = malloc(sizeof(nodeType) + (nops-1) * sizeof(nodeType *))) == NULL)
        yyerror("Out of memory");
     
        
    p->type = typeOpr;
    p->opr.oper = oper;
    p->opr.nops = nops;
    va_start(ap, nops);
    for (i = 0; i < nops; i++)
        p->opr.op[i] = va_arg(ap, nodeType*);
    va_end(ap);
    return p;
}

void freeNode(nodeType *p) {
    int i;

    if (!p) return;
    if (p->type == typeOpr) {
        for (i = 0; i < p->opr.nops; i++)
            freeNode(p->opr.op[i]);
    }
    free (p);
}

void yyerror(char *s) {
       struct errmsg message;
       message.e_mesg = s;
        errorHandler(&message);
        //fprintf(stdout, "%s\n", s);
}

int main(void){
    yyparse ();
    return 0;
}

int ex(nodeType *p) {
    if (!p) return 0;
    switch(p->type) {
    case typeCon:       return p->con.value;
    case typeId:        return sym[p->id.i];
    case typeOpr:
        switch(p->opr.oper) {
        case WHILE:     while(ex(p->opr.op[0])) ex(p->opr.op[1]); return 0;
        case IF:        if (ex(p->opr.op[0]))
                            ex(p->opr.op[1]);
                        else if (p->opr.nops > 2)
                            ex(p->opr.op[2]);
                        return 0;
        case PRINT:     printf("%d\n", ex(p->opr.op[0])); return 0;
        case RETURN:    printf("%d\n", ex(p->opr.op[0])); return 0; 
        case ';':       ex(p->opr.op[0]); return ex(p->opr.op[1]);
        case '=':       return sym[p->opr.op[0]->id.i] = ex(p->opr.op[1]);
        case UMINUS:    return -ex(p->opr.op[0]);
        case '+':       return ex(p->opr.op[0]) + ex(p->opr.op[1]);
        case '-':       return ex(p->opr.op[0]) - ex(p->opr.op[1]);
        case '*':       return ex(p->opr.op[0]) * ex(p->opr.op[1]);
        case '/':       return ex(p->opr.op[0]) / ex(p->opr.op[1]);
        case '<':       return ex(p->opr.op[0]) < ex(p->opr.op[1]);
        case '>':       return ex(p->opr.op[0]) > ex(p->opr.op[1]);
        case GE:        return ex(p->opr.op[0]) >= ex(p->opr.op[1]);
        case LE:        return ex(p->opr.op[0]) <= ex(p->opr.op[1]);
        case NE:        return ex(p->opr.op[0]) != ex(p->opr.op[1]);
        case EQ:        return ex(p->opr.op[0]) == ex(p->opr.op[1]);
        }
    }
    return 0;
}