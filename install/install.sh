#!/bin/sh -e
#  #### ##    ##  ######  ########    ###    ##       ##
#   ##  ###   ## ##    ##    ##      ## ##   ##       ##
#   ##  ####  ## ##          ##     ##   ##  ##       ##
#   ##  ## ## ##  ######     ##    ##     ## ##       ##
#   ##  ##  ####       ##    ##    ######### ##       ##
#   ##  ##   ### ##    ##    ##    ##     ## ##       ##
#  #### ##    ##  ######     ##    ##     ## ######## ########
##############################################################
## Run this script from the "yggdrasil_installer" directory to install Yggdrasil

clear && printf "\
  ___           _        _ _   \n\
 |_ _|_ __  ___| |_ __ _| | |  \n\
  | || '_ \/ __| __/ _\` | | | \n\
  | || | | \__ \ || (_| | | |  \n\
 |___|_| |_|___/\__\__,_|_|_|  \n\
                               \n\
 Congratulations! You have begun the installation of Yggdrasil.\n"
sleep 1

if [ "$(basename "$(pwd)")" = "yggdrasil_installer" ]; then
  echo ""
else
  echo "Please cd into the \"yggdrasil_installer\" directory to start the installation in order to avoid any unfortunate mishaps."
  exit 1
fi

mkdir -pv "/mnt/gentoo"

rm -rf "/mnt/gentoo"
