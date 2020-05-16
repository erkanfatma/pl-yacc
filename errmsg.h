#include <stdio.h>

struct errmsg{
    int e_state; /* parser state number*/
    char *e_mesg; /*message text*/
    void (*print)(const struct errmsg*);
};

// errtab[] = {
//     0, "invalid decleration",
//     1, "end of file expected",
//     2, "invalid decleration",
//     12, "missing semicolon",
// };

void errorHandler(struct errmsg * message);


void errorHandler( struct errmsg * message){
    printf("Error occured: %s\n ", message->e_mesg );
}