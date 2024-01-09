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

function execute() {
    label=$1
    shift

    $2 2>/dev/null &
    pid=$!

    spin='-\|/'
    i=0
    time_elapsed=0

    while kill -0 $pid 2>/dev/null
    do
        i=$((i + 1) % 4)
        time_elapsed=$time_elapsed + 0.1
        printf "\r${spin:$i:1} [$time_elapsed] $label"
        sleep 0.1
    done
    use-color $bg_black $green "✔️ [$time_elapsed] $label"
}

function add_config_file() {
    ln -s ../dotfiles/$1 /home/$(whoami)/$1
}

function run_with_maybe_flag() {
    quiet_flag = $1
    shift

    should_use_flag = $1
    shift

    cmd = $1
    shift

    if $should_use_flag
    then
        $cmd $quiet_flag $@
    else
        $cmd $@
    fi
}