
help: # Print help on Makefile
	@grep '^[^.#]\+:\s\+.*#' Makefile | \
	sed "s/\(.\+\):\s*\(.*\) #\s*\(.*\)/`printf "\033[93m"`\1`printf "\033[0m"`	\3 [\2]/" | \
	expand -t20

install-root: common-install common-configure hack # installs the basic stuff, run as ROOT 

install-user: user-packages user-configure # Run with SUDO!

install-de: i3 kde # Installs the i3 and kde (minimal) Desktop enviroments (Run with sudo)



# Sub commands

common-install: 
	cd common/scripts/ && ./install.sh

common-configure: 
	cd common/scripts/ && ./configure-basic.sh && ./login.sh

hack:
	cd common/hack/ && sudo ./set-keyring.sh && sudo ./set-up-pacman.sh



### 
# These are the functions for set up the basic packages
# and disable the annoying beep sound
# and of course the japanese environment
###
user-packages:
	cd common/ && sudo ./install-packages.sh files/packages && ./install-packages.sh files/packages.conf

user-configure: 
	cd profile/ && sudo ./disable-beep.sh && ./ja/configure-ja-xprofile.sh


i3: 
	cd common/ && \
	sudo ./install-packages.sh ../profile/files/i3-pkg.conf && \
	./install-packages.sh ../profile/files/i3-pkg.conf

kde: 
	cd common/ && \
	sudo ./install-packages.sh ../profile/files/kde-pkg.conf && \
	./install-packages.sh ../profile/files/kde-pkg.conf

update-config: # Refresh the required files for a fresh start
	cd common/scripts/ && ./update-git-config.sh ../baklist/list


user-home-configure:
	cd common/scripts/ && ./update-home.sh ../backlist/list
