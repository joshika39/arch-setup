help: # Print help on Makefile
	@grep '^[^.#]\+:\s\+.*#' Makefile | \
	sed "s/\(.\+\):\s*\(.*\) #\s*\(.*\)/`printf "\033[93m"`\1`printf "\033[0m"`	\3 [\2]/" | \
	expand -t20

install-arch: # Installs arch with pacstrap
	cd install-arch/arch/ && ./install.sh $(VER)	

install-packages: # Installs joshik39's most used apps packages
	cd install-arch/install/ && sudo ./install-official-packages.sh $(VER) 

install-apps: # Installs joshik39's most used apps
	cd install-arch/install/ && sudo ./install-official-apps.sh && ./install-aur-apps.sh	

configure-console: # Configures bash
	cd install-arch/configure/scripts/ && sudo ./setup-bash.sh && sudo ./login.sh

configure-git: # Configures git
	cd install-arch/configure/scripts/ && . ./setup-git.sh 

configure-ja: # Configures the japanese enviroment -- DONE
	cd japanese/ja && sudo configure-ja-env.sh && configure-ja-xprofile.sh

configure-hack: # Adds a custom hack repository -- DONE
	cd install-arch/hack/ && sudo ./set-up-pacman.sh && sudo ./set-keyring.sh

configure-firefox: # Adds a custom look to firefox -- DONE
	cd install-arch/configure/ && ./firefox.sh	
