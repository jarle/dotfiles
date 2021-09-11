#!/usr/bin/env bash

set -e

SSL_REPO="git@github.com:jarle/dotfiles.git"
HTTPS_REPO="https://github.com/jarle/dotfiles.git"

TARGET="$HOME/git/dotfiles"


function main() {
    echo "Installing into $TARGET"
    clone
    run_dot
}

function clone() {
    mkdir -p $TARGET
    if [[ -f "$TARGET"/dot ]]; then
        (cd $TARGET && git pull --rebase)
    else
        git clone --depth=1 $SSL_REPO $TARGET || echo "Unable to install with SSL keys, using HTTPS" && \
            git clone --depth=1 $HTTP_REPO $TARGET
    fi
}

function run_dot() {
    $TARGET/dot
}

main
