grammar Language;

/*
 * Parser Rules
 */
expr : '-' expr | expr ('/' | '+' | '-') expr | '(' expr ')' | NUMBER | VARIABLE | NUMBER VARIABLE;
op_sum   : (VARIABLE|NUMBER) ADD  (VARIABLE|NUMBER);
op_sub   : (VARIABLE|NUMBER) SUB  (VARIABLE|NUMBER);
op_div   : (VARIABLE|NUMBER) DIV  (VARIABLE|NUMBER);
op_mult  : (VARIABLE|NUMBER) MULT (VARIABLE|NUMBER);

/*
 * Lexer Rules
 */
fragment UNDERSCORE : '_' ;
fragment LETTER : [a-zA-Z] ;
fragment LETTERORDIGIT : LETTER | DIGIT;

DIGIT      : [0-9];
NUMBER     : [0-9]+;
WHITESPACE : [ \t\r] -> skip;
LBRACKET   : '{';
RBRACKET   : '}';
LBRACE     : '(';
RBRACE     : ')';
VARIABLE   : LETTER | LETTER UNDERSCORE LETTERORDIGIT | LETTER UNDERSCORE LBRACKET (VARIABLE|NUMBER) RBRACKET;
// EXPRESSION : VARIABLE | NUMBER | (LBRACE EXPRESSION RBRACE);

ADD        : '+';
SUB        : '-';
DIV        : '/';
FRAC       : '\frac';
MULT       : '\times';
