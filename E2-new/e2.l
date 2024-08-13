%{
#include <stdio.h>
#include <stdlib.h>
#include "token.h"

int yylval;  // variável para armazenar o valor do token
%}

%%

[0-9]+      { yylval = atoi(yytext); printf("constante decimal: %d\n", yylval); return NUMBER; }
"+"         { return PLUS; }
"-"         { return MINUS; }
"*"         { return TIMES; }
"/"         { return DIV; }
\n          { printf("código do token: %d\n", EOL); return EOL; }
[ \t]+      { /* Ignorar espaços e tabulações */ }
.           { return ERROR; }

%%

int yywrap() {
    return 1;
}
