all: lab1
lab1: clean
	yacc -d xml_parser.y
	lex xml_parser.l
	cc lex.yy.c y.tab.c -o xml_parser -lm
clean:
	rm -rf xml_parser lex.yy.c y.tab.c y.tab.h
