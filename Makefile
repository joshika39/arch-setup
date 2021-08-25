
help: # Print help on Makefile
	@grep '^[^.#]\+:\s\+.*#' Makefile | \
	sed "s/\(.\+\):\s*\(.*\) #\s*\(.*\)/`printf "\033[93m"`\1`printf "\033[0m"`	\3 [\2]/" | \
	expand -t20

install-root: common-install common-configure # installs the basic stuff, run as ROOT 

install-user: user-packages user-configure # Install the common packages

install-de: i3 # Installs the i3 and kde (minimal) Desktop environments (Run with sudo)

install-live-arch: user-packages-live user-configure i3 # Install a basic arc to a usb

update-config: # Refresh the required files for a fresh start
	cd common/scripts/ && ./update-git-config.sh ../baklist/list

update-home: # Copy the repository contents to HOME
	cd common/scripts/ && ./update-home.sh ../baklist/list

git-config: # logins to git via SSH
	cd profile/ && ./setup-git.sh



##################################
##				##
##	INITIAL FUNCTIONS	##
##				##
##################################

###
# These are the functions for the first command
# which is obligatory if you want to proceed
###
common-install: 
	cd common/scripts/ && ./install.sh $(VER) $(IPATH)

common-configure: 
	cd common/scripts/ && ./configure-basic.sh && ./login.sh

hack:
	cd common/hack/ && sudo ./set-keyring.sh && sudo ./set-up-pacman.sh


### 
# These are the functions for set up the basic packages
# and disable the annoying beep sound
# and of course the Japanese environment
###

custom-packages:
	cd common/scripts/ && \
		./install-packages.sh ../files/user-packages.conf && \
		sudo ./install-packages.sh ../files/user-packages.conf
user-packages:
	cd common/scripts/ && \
		./install-packages.sh ../files/default-packages.conf && \
		sudo ./install-packages.sh ../files/default-packages.conf && \
		./install-packages.sh ../files/extra-packages.conf && \
		sudo ./install-packages.sh ../files/extra-packages.conf

user-packages-live:
	cd common/scripts/ && \
		./install-packages.sh ../files/default-packages.conf && \
		sudo ./install-packages.sh ../files/default-packages.conf && \
		./install-packages.sh ../files/extra-packages-live.conf && \
		sudo ./install-packages.sh ../files/extra-packages-live.conf

user-configure: 
	cd profile/ && sudo ./disable-beep.sh && ./japanese/ja/configure-ja-xprofile.sh && ./setup-assets.sh


###
# These two (i3, kde) are for installing the required
# packages as well from aur as the official repository
###
i3: 
	cd common/scripts/ && \
	sudo ./install-packages.sh ../../profile/files/i3-pkg.conf && \
	./install-packages.sh ../../profile/files/i3-pkg.conf

kde: 
	cd common/scripts/ && \
	sudo ./install-packages.sh ../../profile/files/kde-pkg.conf && \
	./install-packages.sh ../../profile/files/kde-pkg.conf

