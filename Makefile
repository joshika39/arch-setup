help: # Print help on Makefile
	@grep '^[^.#]\+:\s\+.*#' Makefile | \
	sed "s/\(.\+\):\s*\(.*\) #\s*\(.*\)/`printf "\033[93m"`\1`printf "\033[0m"`	\3 [\2]/" | \
	expand -t20

install-arch: # Installs arch with pacstrap
	cd arch/ && ./install.sh $(VER)	

install-packages: # Installs joshik39's most used apps packages
	cd install/ && sudo ./install-official-packages.sh $(VER) 

install-apps: # Installs joshik39's most used apps
	cd install/ && sudo ./install-official-apps.sh && ./install-aur-apps.sh	

configure-arch: # Configures bash
	cd arch/ && ./setup-bash.sh

configure-git: # Configures git
	cd configure/ && . ./setup-git.sh 

configure-ja: # Configures the japanese enviroment
	sudo ja/configure-ja-env.sh && ja/configure-ja-xprofile.sh

configure-hack: # Adds a custom hack repository
	cd hack/ && sudo ./set-up-pacman.sh && sudo ./set-keyring.sh

configure-firefox: # Adds a custom look to firefox
	cd configure/ && ./firefox.sh	
