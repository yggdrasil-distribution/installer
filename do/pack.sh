#!/bin/sh -e

# This file is part of the Yggdrasil Installer.
#   the Yggdrasil Installer is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
#   the Yggdrasil Installer is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
#   You should have received a copy of the GNU General Public License along with the Yggdrasil Installer. If not, see <https://www.gnu.org/licenses/>.

# This script packs the files required for installation into a directory and compresses it for ease of transfer

BUILD_DIR="build"
DEPLOY_DIR="yggdrasil_installer"

DESTINATION_DIR="${BUILD_DIR}/${DEPLOY_DIR}"

echo "Packing Yggdrasil into $DESTINATION_DIR..."

# Clean the DESTINATION_DIR
rm -rf "$DESTINATION_DIR"
rm "${BUILD_DIR}/${DEPLOY_DIR}.tar.xz" || echo "No tarball to clean"
mkdir -p "$DESTINATION_DIR"


#################################
## Copy the necessary individual directories

# Include license
cp "LICENSE" "$DESTINATION_DIR"

# Include install directory
cp -r install "$DESTINATION_DIR"

# Include toolbox directory
cp -r toolbox "$DESTINATION_DIR"

# Make scripts executable
mk_exec () {
  chmod +rx "$1"
}
find "$DESTINATION_DIR" -type f -name "*.sh" \
  | while read -r script; do
    mk_exec "$script"
  done
find "$DESTINATION_DIR" -type f -name "*.py" \
  | while read -r script; do
    mk_exec "$script"
  done

# Create symlinks for ease of use
ln -srf "$DESTINATION_DIR/install/install.sh" "$DESTINATION_DIR/yggdrasil_install"
ln -srf "$DESTINATION_DIR/install/install.conf" "$DESTINATION_DIR/configuration"

#################################

# Package and compresses
project_dir="$(pwd)"
cd "$BUILD_DIR"
tar cf "${DEPLOY_DIR}.tar" "$DEPLOY_DIR"

xz -9vT0 "${DEPLOY_DIR}.tar"

# Verify
echo "Final tarball size:"
ls -lha "${DEPLOY_DIR}.tar.xz"
echo ""
echo "Tarball contents:"
tar vtf "${DEPLOY_DIR}.tar.xz"

cd "$project_dir"
