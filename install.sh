#!/usr/bin/env bash

set -e
set -o nounset

SSL_REPO="git@github.com:jarle/dotfiles.git"
HTTP_REPO="https://github.com/jarle/dotfiles.git"

GIT_DIR="$HOME/git"
TARGET="$GIT_DIR/dotfiles/"


function main() {
    echo "Installing into $TARGET"
    clone
    run_dot
}

function clone() {
    mkdir -p "$GIT_DIR"
    if [[ -f "$TARGET"/dot ]]; then
        (cd $TARGET && git pull --rebase)
    else
        (cd "$GIT_DIR")
        git clone --depth=1 $SSL_REPO $TARGET || echo "Unable to install with SSL keys, using HTTPS" && \
            git clone --depth=1 $HTTP_REPO $TARGET
    fi
}

function run_dot() {
    $TARGET/dot
}

main
