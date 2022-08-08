#! /usr/bin/env nix-shell
#! nix-shell -i bash -p coreutils
set -euo pipefail

dev="${1:?Missing device name as argument (eg /dev/sda)}"
[ -w "$dev" ] || { echo "Cannot write to $dev. Try running as root?"; exit 1; }

echo "Building"
bash ./build.sh

echo "Flashing $dev"
dd \
  if="$(echo ./result/iso/*.iso)" \
  of="$dev" \
  bs=4M \
  conv=fdatasync \
  status=progress

echo "Ok, done!"
