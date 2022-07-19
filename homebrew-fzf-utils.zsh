#!/usr/bin/env zsh

if ! (( $+commands[brew] )); then
    echo 'brew command not found: please install via https://brew.sh/'
    exit
fi

if ! (( $+commands[fzf] )); then
    echo 'fzf command not found: please install via "brew install fzf"'
    exit
fi

function hfu_install() {

}

function hfu_uninstall() {

}

function hfu_update() {

}

function hfu_init() {

}

autoload hfu_install
autoload hfu_uninstall
autoload hfu_update
autoload hfu_init
