{ config, lib, pkgs, ... }:

{
  imports = [
    ./tailscale.nix
    ./nix.nix
    ./locale.nix
    ./ssh.nix
    ./firewall.nix

  ];
}
