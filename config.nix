{ lib, ... }:

{
  imports = [
    <nixpkgs/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix>
  ];

  # I prefer nmcli over wpa_supplicant
  networking.wireless.enable = lib.mkForce false;
  networking.networkmanager.enable = true;
}

