#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Project : TrueColors                                             /          \
# Filename: install.sh                                            |     ()     |
# Date    : 01/03/2024                                            |            |
# Author  : cyclopticnerve                                        |   \____/   |
# License : WTFPLv2                                                \          /
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# Constants
# ------------------------------------------------------------------------------
# names to be used in program
NAME_BIG="TrueColors"
NAME_SMALL="truecolors"

# the binary file constants
BIN_FILE=$NAME_SMALL
BIN_DIR="$HOME/.local/bin"

# the service name constants
SVC_FILE="$NAME_SMALL.service"
SVC_DIR="$HOME/.config/systemd/user"

# ------------------------------------------------------------------------------
# Main
# ------------------------------------------------------------------------------
# make sure not running as root
if [ $(id --user) -eq 0 ]; then
    echo "Do not run as root"
    exit 1
fi

# show user we are doing something
echo "Installing $NAME_BIG ..."

# make dst dirs
mkdir -vp $BIN_DIR
mkdir -vp $SVC_DIR

# copy files to dirs
cp -vf $BIN_FILE $BIN_DIR
cp -vf $SVC_FILE $SVC_DIR

# make bin executable
chmod +x $BIN_DIR/$BIN_FILE

# reload and start service
systemctl --user daemon-reload
systemctl --user stop $SVC_FILE
systemctl --user start $SVC_FILE

echo "Install $NAME_BIG_ complete."

# -)
