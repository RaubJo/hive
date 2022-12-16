{ config, lib, pkgs, ... }:

{
  imports = [
    ./networks.nix
    ./tailscale.nix
    ./locale.nix
    ./nix.nix
    ./firewall.nix
    ./fonts.nix
    ./plymouth.nix
    ./ssh.nix
    ./printing.nix
    ./env.nix
  ];
}
