#!/bin/sh -e

# This file is part of the Yggdrasil Installer.
#   the Yggdrasil Installer is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
#   the Yggdrasil Installer is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
#   You should have received a copy of the GNU General Public License along with the Yggdrasil Installer. If not, see <https://www.gnu.org/licenses/>.

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

is_correct_dir () {
  if [ "$(basename "$(pwd)")" != "yggdrasil_installer" ]; then
    echo "Please cd into the \"yggdrasil_installer\" directory to start the installation in order to avoid any unfortunate mishaps."
    exit 1
  fi
}

is_root_user () {
  if [ "$(whoami)" != "root" ]; then
    echo "Please run the installation script as root"
    exit 1
  fi
}

# Check if the requirements are met to complete the installation properly
is_root_user
is_correct_dir

mkdir -pv "/mnt/gentoo"

rm -rf "/mnt/gentoo"
