#!/usr/bin/env bash

set -e
set -o nounset

sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply jarle
