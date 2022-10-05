#!/usr/bin/env bash
set -euo pipefail

nix-build \
  --expr '( import <nixpkgs/nixos> )' \
  -I nixos-config="$(realpath ./config.nix)" \
  -A config.system.build.isoImage \
  "$@"
