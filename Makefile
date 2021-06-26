all: 
	

install-packages:
	cd packages/ && sudo ./install-official-packages.sh 

configure-theme:
	cd packages/ && sudo ./configure-theme.sh

install-apps:
	cd packages/ && sudo ./install-official-apps.sh && ./install-aur-apps.sh

configure-ja:
	sudo ja/configure-ja-env.sh && ja/configure-ja-xprofile.sh

configure-hack:
	cd hack/ && sudo ./set-up-pacman.sh && sudo ./set-keyring.sh
