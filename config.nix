{ pkgs, lib, ... }: let

# see https://stackoverflow.com/a/73098226/4608364
tmp-pkgs = import <nixpkgs> {};

nixos-hardware =
  tmp-pkgs.fetchFromGitHub
    { owner = "nixos";
      repo = "nixos-hardware";
      rev = "1fec8fda86dac5701146c77d5f8a414b14ed1ff6";
      sha256 = "sha256-IOTq5tAGGmBFj7tQbkcyLE261JUeTUucEE3p0WLZ4qM=";
    };

kakoune =
  import
    (pkgs.fetchFromGitHub
        { owner = "quelklef";
          repo = "habitat";
          rev = "5661fd177f090da60cad9388232fa56281746622";
          sha256 = "sha256-M+QfY0cHH6aBAqGS77L9kVDtZDqe+0QTySw/qImFYPM=";
        } + /files/kakoune/kakoune.nix)
    { inherit pkgs; };

# --

nixos-installer-base =
  <nixpkgs/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix>;

nmcli = {
  # prefer nmcli over wpa_supplicant
  networking.wireless.enable = lib.mkForce false;
  networking.networkmanager.enable = true;
};

# Lenovo T14 Gen2 (AMD)
t14 = {
  imports = [
    nixos-installer-base
    (nixos-hardware + /lenovo/thinkpad/t14/amd/gen2)
    nmcli
  ];
  boot.kernelPackages = pkgs.zfs.latestCompatibleLinuxPackages;
  environment.systemPackages = with pkgs; [ wirelesstools ];
};

in t14

