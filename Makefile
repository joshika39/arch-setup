all: 
	

install-packages:
	cd packages/ && sudo ./install-xorg-packages.sh && sudo ./install-plasma-packages.sh && sudo ./install-misc-packages.sh

configure-theme:
	sudo ./configure-theme.sh

install-apps:
	cd packages/ && sudo ./install-official-apps.sh && ./install-aur-apps.sh

configure-ja:
	sudo ja/configure-ja-env.sh && ja/configure-ja-xprofile.sh

configure-hack:
	cd hack/ && sudo ./set-up-pacman.sh && sudo ./set-keyring.sh
