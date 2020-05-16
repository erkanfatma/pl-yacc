static struct errmsg{
    int e_state; /* parser state number*/
    char *e_mesg; /*message text*/
} errtab[] = {
    0, "invalid decleration",
    1, "end of file expected",
    2, "invalid decleration",
    12, "missing semicolon",
}

