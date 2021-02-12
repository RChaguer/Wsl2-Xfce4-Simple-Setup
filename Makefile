all: install

install : guiwsl.sh interface.sh
	chmod 0755 guiwsl.sh
	./guiwsl.sh

interface : install

start :
	interface start

stop :
	interface stop

restart :
	interface restart
