#include <stdio.h>
#include "token.h"

extern int yylex();
extern int yylval;

int main() {
    int token;
    while ((token = yylex())) {
        switch (token) {
            case PLUS:
            case MINUS:
            case TIMES:
            case DIV:
                printf("código do token: %d\n", token);
                break;
            case ERROR:
                printf("erro léxico! código do token: %d\n", token);
                break;
            default:
                break;
        }
    }
    return 0;
}