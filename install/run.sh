#!/bin/bash

black=30
red=31
green=32
yellow=33
blue=34
purple=35
cyan=36
grey=37
white=97

bg_black=40
bg_red=41
bg_green=42
bg_yellow=43	
bg_blue=44	
bg_magenta=45
bg_cyan=46
bg_grey=47
bg_white=107

function use-color() {
    echo -e "\033[0;$1;$2m$3\033[0m"
}

function title() {
    echo
    use-color $bg_black $cyan "**${1//?/\*}**"
    use-color $bg_black $cyan "* $1 *"
    use-color $bg_black $cyan "**${1//?/\*}**"
}

function assert() {
    echo -en `use-color $bg_black $yellow "Checking $1...\r"`

    if [[ $2 == $3 ]]; then
        echo -en `use-color $bg_black $black "Checking $1...\r"`
        use-color $bg_black $green "✔️ $1"
    else
        echo -en `use-color $bg_black $black "Checking $1...\r"`
        use-color $bg_black $red "❌ $1"
        echo
        use-color $bg_red $white "$4"
        exit 1
    fi
}

function one-line() {
    $* | while read -r line; do echo -en "\r$line"; done
}

function repeat() {
    printf "%$1s" " "
}

function execute() {
    empty_row="$(repeat `tput cols`)"
    use-color $bg_red $red $empty_row

    use-color $bg_black $yellow "$1..."
    one-line $2
    echo -en "\r$empty_row\r\033[1A$empty_row\r\033[1A"
    use-color $bg_black $green "✔️ $1"
}

clear
cat ascii_art.txt

title "Checking Prerequisites"

assert "Script is running as root" \
    `whoami` "root" \
    "Please run this script as root or using sudo"

has_network=`curl google.com > /dev/null; echo $?`
assert "Script has network connectivity" \
    has_network "0" \
    "Please connect to the internet"

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
    "Adding New Stuff" \
    "sudo apt-get install git vim build-essential wget zsh sl toilet cowsay fortune imagemagick x11-apps ruby-full maven dnsutils"

execute \
    "Installing Oh My Zsh" \
    "sh -c \"$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\""

execute \
    "Installing NVM" \
    "curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash"

title "Adding Config Files"
cp .gitconfig /home/$SUDO_USER
cp .zshrc /home/$SUDO_USER
cp .vimrc /home/$SUDO_USER

title "Success! Enjoy your new computer!"
