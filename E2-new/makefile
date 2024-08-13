install:
	sudo apt-get install -f flex

compile:
	flex e2.l
	cc -o analisa-e2 lex.yy.c main.c

test:
	./run_tests.sh

all:
	make install
	make compile
	make test


