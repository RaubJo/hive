{ inputs, cell, }:
let
  init = { config, pkgs, lib, ... }: {
    boot.binfmt.emulatedSystems = [ "aarch64-linux" ];
    boot.loader.grub = {
      enable = true;
      devices = [ "/dev/sda" ];
      useOSProber = true;
    };
    networking.hostName = "nephos";
    services.getty.autologinUser = "kurios";
    services.nextcloud.config.extraTrustedDomains =
      [ "192.168.1.115" "100.74.102.53" ];
    system.stateVersion = "23.05";
  };
in rec {
  bee.system = "x86_64-linux";
  bee.home = inputs.home;
  bee.pkgs = import inputs.nixos {
    inherit (inputs.nixpkgs) system;
    config.allowUnfree = true;
  };
  imports = [
    init
    cell.hardwareProfiles.nephos
    cell.nixosSuites.base
    cell.nixosSuites.gitea-server
    cell.nixosProfiles.docker
    cell.nixosProfiles.ddclient
    ../../nixosModules/gitServer.nix
  ];
}
