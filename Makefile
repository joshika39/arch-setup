
help: # Print help on Makefile
	@grep '^[^.#]\+:\s\+.*#' Makefile | \
	sed "s/\(.\+\):\s*\(.*\) #\s*\(.*\)/`printf "\033[93m"`\1`printf "\033[0m"`	\3 [\2]/" | \
	expand -t20

install: common # installs the basic stuff, run as root 

common-install: 
	cd common/ && ./install.sh

common-configure: 
	cd common/ && ./configure-basic.sh && ./disable-beep.sh
