typedef enum { typeCon, typeId, typeOpr } nodeEnum;


typedef struct {
    int value;                  
} conNodeType;


typedef struct {
    int i;                     
} idNodeType;


typedef struct {
    int oper;                   
    int nops;                   /* number of operand */
    struct nodeTypeTag *op[1];	/* operands, extended at runtime */
} oprNodeType;

typedef struct nodeTypeTag {
    nodeEnum type;              /* <<< type of node */

    union {
        conNodeType con;        /* consstant */
        idNodeType id;          /* identifiers */
        oprNodeType opr;        /* operators */
    };
} nodeType;

extern int sym[26];
