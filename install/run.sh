#!/bin/bash
set -e

REPO=${REPO:-https://github.com/piticent123/.files}
echo $REPO

if ! command -v git &> /dev/null
then
    echo "Git is needed to run this script"
    sudo apt-get install git
fi

temp_dir=$(mktemp -d)
home_dir=/home/$(whoami)

cd $temp_dir
git clone $REPO .files
cd .files/install
source ./utils.sh
# clear
cat ascii_art.txt

# title "Reading Secrets"
# npm auth token
# pubkeys

title "Installing Software"

execute \
    "Updating" \
    "sudo apt-get update"

execute \
    "Upgrading" \
    "sudo apt-get upgrade -y"

execute \
    "Installing new packages" \
    "sudo apt-get install git vim build-essential wget zsh sl toilet cowsay fortune imagemagick x11-apps ruby-full maven dnsutils"

execute \
    "Installing Oh My Zsh" \
    "sh -c \"$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\""

execute \
    "Installing NVM" \
    "curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash"

# RVM?
# SDKman (java)?
# maven?

title "Adding Config Files"
for dotfile in $(ls ../dotfiles); do
    echo "Adding dotfile $dotfile"
    add_config_file $dotfile
done

title "Success! Enjoy your new computer!"
