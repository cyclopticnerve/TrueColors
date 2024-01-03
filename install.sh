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
NAME_BIG="TrueColors"
NAME_SMALL="truecolors"

BIN_FILE=$NAME_SMALL
BIN_DIR=~"~/.local/bin"
SVC_FILE="$NAME_SMALL.service"
SVC_DIR=~"~/.config/systemd/user"

# ------------------------------------------------------------------------------
# Main
# ------------------------------------------------------------------------------
# make sure not running as root
if [ $(id --user) -eq 0 ]; then
    echo "Do not run as root"
    exit 1
fi

# copy files
echo "Installing $NAME_BIG..."

# make dst dirs
mkdir -vp $BIN_DIR
mkdir -vp $SVC_DIR

# copy files to dirs
cp -vf $BIN_FILE $BIN_DIR
cp -vf $SVC_FILE $SVC_DIR

# make bin executable
chmod +x $BIN_DIR/$BIN_FILE

# let user know we are done
echo "Installed $NAME_BIG ..."

# reload and start service
systemctl --user daemon-reload
systemctl --user stop $SVC_FILE
systemctl --user start $SVC_FILE

# -)
