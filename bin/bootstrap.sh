#!/usr/bin/env bash
set -e

command_exists () {
    type "$1" &> /dev/null ;
}

# Bootstrap to install ansible
if command_exists apt-get ; then
    apt-get --no-install-recommends -y install ansible
elif command_exists brew ; then
    brew install ansible
elif command_exists pacman ; then
    pacman -S ansible
else
    echo "No valid package manager found!"
    exit 1
fi
