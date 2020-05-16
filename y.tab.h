/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    INTEGER = 258,
    VARIABLE = 259,
    IDENT = 260,
    WHILE = 261,
    IF = 262,
    PRINT = 263,
    TYPE_CHAR = 264,
    TYPE_INT = 265,
    COMMENT = 266,
    RETURN = 267,
    STRUCT = 268,
    MAIN_METHOD = 269,
    METHOD = 270,
    EXIT = 271,
    IFX = 272,
    ELSE = 273,
    GE = 274,
    LE = 275,
    EQ = 276,
    NE = 277,
    UMINUS = 278
  };
#endif
/* Tokens.  */
#define INTEGER 258
#define VARIABLE 259
#define IDENT 260
#define WHILE 261
#define IF 262
#define PRINT 263
#define TYPE_CHAR 264
#define TYPE_INT 265
#define COMMENT 266
#define RETURN 267
#define STRUCT 268
#define MAIN_METHOD 269
#define METHOD 270
#define EXIT 271
#define IFX 272
#define ELSE 273
#define GE 274
#define LE 275
#define EQ 276
#define NE 277
#define UMINUS 278

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 21 "ftlang.y" /* yacc.c:1909  */

    int iValue;                 
    char sIndex; 
    char c[30];            
    nodeType *nPtr;     
    struct symtab *symp;        

#line 108 "y.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
