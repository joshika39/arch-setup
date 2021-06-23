all: 
	

install-packages:
	cd packages/ && sudo ../install-xorg-packages.sh && sudo ../install-plasma-packages.sh && ../install-misc-packages.sh

configure-theme:
	sudo ./configure-theme.sh

install-apps:
	cd packages/ && ../install-aur-apps.sh sudo ../install-official-apps.sh

configure-ja:
	sudo ja/configure-ja-env.sh && ja/configure-ja-xprofile.sh
