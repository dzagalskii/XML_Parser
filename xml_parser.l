%{
#include "y.tab.h"
#include <stdbool.h>

int yyerror();

int lines_number = 0;
bool comment_check = false;
%}

letter												[A-Za-z_]
digit												[0-9]
special_symbols										"&lt"|"&gt"|"&amp"
all_symbols											[\~\@\#\$\%\^\*\!\"\(\)\+\{\}\"\|\[\]\;\'\\\,\.\/]					

%%

"<!--"												{/*printf("COMMENT_OPEN\n");*/ comment_check = true; return COMMENT_OPEN;}
"-->"												{/*printf("COMMENT_CLOSE\n");*/ comment_check = false; return COMMENT_CLOSE;}
"<?"												{if(!comment_check){/*printf("DECLARATION_OPEN\n");*/ return DECLARATION_OPEN;} /*else{/*printf("KOMMENT_DO\n");}*/}
"?>"												{if(!comment_check){/*printf("DECLARATION_CLOSE\n");*/ return DECLARATION_CLOSE;} /*else{printf("KOMMENT_DC\n");}*/}
"<"													{if(!comment_check){/*printf("TAG_BEG_OPEN\n");*/ return TAG_BEG_OPEN;} /*else{printf("KOMMENT_TBO\n");}*/}
"</"												{if(!comment_check){/*printf("TAG_END_OPEN\n");*/ return TAG_END_OPEN;} /*else{printf("KOMMENT_TEO\n");}*/}
">"													{if(!comment_check){/*printf("TAG_CLOSE\n");*/ return TAG_CLOSE;} /*else{printf("KOMMENT_TC\n");}*/}
"/>"												{if(!comment_check){/*printf("EMPTY_TAG_CLOSE\n");*/ return EMPTY_TAG_CLOSE;} /*else{printf("KOMMENT_ETC\n");}*/}
"<!DOCTYPE"											{if(!comment_check){/*printf("DTD_OPEN\n");*/ return DTD_OPEN;} /*else{printf("KOMMENT_DTD\n");}*/}
({letter})({letter}|{digit})*						{if(!comment_check){/*printf("NAME\n");*/ return NAME;} /*else{printf("KOMMENT_N\n");}*/}
((\")({letter}|{digit}|{special_symbols}|.)*(\"))	{if(!comment_check){/*printf("ATTRIBUTE\n");*/ return ATTRIBUTE;} /*else{printf("KOMMENT_ATTR\n");}*/}
((\')({letter}|{digit}|{special_symbols}|.)*(\'))	{if(!comment_check){/*printf("ATTRIBUTE\n");*/ return ATTRIBUTE;} /*else{printf("KOMMENT_ATTR\n");}*/}
({all_symbols}|{special_symbols}|{digit})* 			{if(!comment_check){/*printf("TEXT\n");*/ return TEXT;} /*else{printf("KOMMENT_TXT\n");}*/}
\:													{if(!comment_check){/*printf("COLON\n");*/ return *yytext;} /*else{printf("KOMMENT_CLN\n");}*/}
\=													{if(!comment_check){/*printf("ASSIGN\n");*/ return *yytext;} /*else{printf("KOMMENT_ASS\n");}*/}
\?													{if(!comment_check){/*printf("QUESTION\n");*/ return *yytext;} /*else{printf("KOMMENT_QST\n");}*/}
\-													{if(!comment_check){/*printf("MINUS\n");*/ return *yytext;} /*else{printf("KOMMENT_MNS\n");}*/}
"\n"                    							lines_number++;
[ \t]+                  							;

%%


int yyerror()
{
    printf("# error on line %d!\n", ++lines_number);
    exit(1);
}

int yywrap() 
{
    printf("# correct!\n\n");
    exit(1);
}