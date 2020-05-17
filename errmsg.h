#include <stdio.h>

struct errmsg{
    int e_state; /* parser state number*/
    char *e_mesg; /*message text*/
    void (*print)(const struct errmsg*);
};

// errtab[] = {
//     0, "Invalid decleration",
//     1, "Invalid decleration",
//     2, "end of file expected",
//     3, "invalid decleration",
//     4, "missing semicolon",
// };

void errorHandler(struct errmsg * message);


void errorHandler( struct errmsg * message){
    printf("Error occured: %s\n ", message->e_mesg );
}