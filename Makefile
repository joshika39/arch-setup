all:


## INSTALLING: install-"object"
# 1. arch
# 2. packages
# 3. apps
#

install-arch:
	cd arch/ && ./install.sh $(VER)	

install-packages:
	cd packages/ && sudo ./install-official-packages.sh $(VER) 

install-apps:
	cd packages/ && sudo ./install-official-apps.sh && ./install-aur-apps.sh


## CONFIGURING: configure-"object"
# 1. git
# 2. ja
# 3. hack
#

configure-git:
	cd configure/ && ./setup-git.sh 

configure-ja:
	sudo ja/configure-ja-env.sh && ja/configure-ja-xprofile.sh

configure-hack:
	cd hack/ && sudo ./set-up-pacman.sh && sudo ./set-keyring.sh

configure-theme:
	cd packages/ && sudo ./configure-theme.sh
