# `nixos-bootable`

- `config.nix` -- defines a NixOS configuration identical to the [minimal ISO image available on the NixOS download page](https://nixos.org/download.html#:~:text=without%20a%20desktop.-,Minimal%20ISO%20image,-The%20minimal%20installation), except perhaps for `nixpkgs` version, and except for a few tweaks I've made for myself
- `build.sh` -- turns `config.nix` into a `.iso` file
- `flash.sh` -- buils the `.iso` and then flashes it onto a block device (such as a USB)
