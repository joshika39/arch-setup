
help: # Print help on Makefile
	@grep '^[^.#]\+:\s\+.*#' Makefile | \
	sed "s/\(.\+\):\s*\(.*\) #\s*\(.*\)/`printf "\033[93m"`\1`printf "\033[0m"`	\3 [\2]/" | \
	expand -t20


scripts=common/scripts/

# 'r' stands for Regular, and it installs the extra packages for a regular setup
rfiles=../files/regular

# The 'l' stands for Live, and it contains the extra packages for the live setup
lfiles=../files/live

# This is for the Desktop environment installing path
# It didn't look good with that long relative path
# It can be used from two subdirectories in.
profilf=../../profile/files


install-os: common-install common-configure # installs the basic stuff. You must run this first

install-regular: required-packages regular-extra configure-user

install-live: required-packages live-extra i3 configure-user # Install a basic arch to a USB disk

install-de: $(DE) # Installs the i3 or KDE (minimal) Desktop environments, add your de choice as an argument (i3/kde)

configure-user: 
	cd profile/ && sudo ./disable-beep.sh && ./japanese/ja/configure-ja-xprofile.sh && ./setup-assets.sh

update-config: update-fortune-git # Refresh the required files for a fresh start
	cd $(scripts) && ./update-git-config.sh ../baklist/list

update-home: update-fortune-home # Copy the repository contents to HOME
	cd $(scripts) && ./update-home.sh ../baklist/list

update-required: required-packages # Updates, the tools and so on

update-extra: $(DIST)-extra # Use 'DIST=' for the OS type (live/regular)

update-user: $(DIST)-user # Use 'DIST=' for the OS type (live/regular)
	
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
common-install/: 
	cd $(scripts) && ./install.sh $(VER) $(IPATH)

common-configure: 
	cd $(scripts) && ./configure-basic.sh && ./login.sh

hack:
	cd common/hack/ && sudo ./set-keyring.sh && sudo ./set-up-pacman.sh


### 
# These are the functions for set up the basic packages
# and disable the annoying beep sound
# and of course the Japanese environment
###
required-packages:
	cd $(scripts) && sudo ./install-packages.sh ../files/default-packages.conf
	cd $(scripts) && ./install-packages.sh ../files/default-packages.conf

live-extra:
	cd $(scripts) && sudo ./install-packages.sh $(lfiles)/extra-packages.conf

regular-extra:
	cd $(scripts) && sudo ./install-packages.sh $(rfiles)/extra-packages.conf


# These two packages are the optional ones
#
live-user:
	cd $(scripts) && sudo ./install-packages.sh $(lfiles)/user-packages.conf

regular-user:
	cd $(scripts) && sudo ./install-packages.sh $(rfiles)/user-packages.conf


###
# These two (i3, KDE) are for installing the required
# packages as well from AUR as the official repository
###
i3: 
	cd $(scripts) && sudo ./install-packages.sh $(profilef)/i3-pkg.conf
	cd $(scripts) && ./install-packages.sh $(profilef)/i3-pkg.conf

kde: 
	cd $(scripts) && sudo ./install-packages.sh $(profilef)/kde-pkg.conf
	cd $(scripts) && ./install-packages.sh $(profilef)/kde-pkg.conf



##################################
##				##
##		MISC		##
##				##
##################################

update-fortune-git:
	cd profile/ && sudo ./update-fortune.sh git

update-fortune-home:
	cd profile/ && sudo ./update-fortune.sh

test-live:
	@echo live

test-regular:
	@echo regular
