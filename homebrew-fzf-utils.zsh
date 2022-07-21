#!/usr/bin/env zsh

if ! (( $+commands[brew] )); then
    echo 'brew command not found: please install via https://brew.sh/'
    exit
fi

if ! (( $+commands[fzf] )); then
    echo 'fzf command not found: please install via "brew install fzf"'
    exit
fi

HFU_INFO='brew info {}'
HFU_BIND='ctrl-space:execute-silent(brew home {})'

function hfu_install_formulae() {
    local formulae=$(echo $(brew formulae | fzf --query="$1" -m --preview $HFU_INFO --bind $HFU_BIND))

    if [[ $formulae ]]; then
        for formula in $formulae; do
            brew install $ƒormula
        done
    fi
}

function hfu_install_cask() {
    local casks=$(echo $(brew casks | fzf --query="$1" -m --preview $HFU_INFO --bind $HFU_BIND))

    if [[ $casks ]]; then
        for cask in $casks; do
            brew install $cask
        done
    fi
}

function hfu_uninstall() {
    local leaves=$(echo $(brew leaves | fzf --query="$1" -m --preview $HFU_INFO --bind $HFU_BIND))

    if [[ $leaves ]]; then
        for leaf in $leaves; do
            brew uninstall $leaf
        done
    fi
}

function hfu_update() {
    local outdated=$(echo $(brew outdated -q | fzf --query="$1" -m --preview $HFU_INFO --bind $HFU_BIND))

    if [[ $outdated ]]; then
        for formula in $outdated; do
            brew upgrade $ƒormula
        done
    fi
}

function hfu_init() {
    alias bip=hfu_install_formulae
    alias bic=hfu_install_cask
    alias bup=hfu_update
    alias brp=hfu_uninstall
}

autoload hfu_install_formulae
autoload hfu_install_cask
autoload hfu_uninstall
autoload hfu_update
autoload hfu_init

hfu_init
