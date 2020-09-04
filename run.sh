#!/bin/bash

function one-line() {
    $* | while read -r line; do echo -en "\r" "$line"; done
}

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

clear
cat ascii_art.txt

title "Checking Prerequisites"

assert "Script is running as root" `whoami` "root" "Please run this script as root or using sudo"

title "Installing Software"
# sudo apt update
# sudo apt upgrade -y

title "Adding Config Files"

title "Success! Enjoy your new computer!"