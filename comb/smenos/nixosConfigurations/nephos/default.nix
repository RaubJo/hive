{ inputs, cell, }:
let
  init = { config, pkgs, lib, ... }: {
    boot.loader.grub = {
      enable = true;
      devices = [ "/dev/sda" ];
      useOSProber = true;
    };

    networking.hostName = "nephos";
    services.getty.autologinUser = "kurios";
    services.nextcloud.config.extraTrustedDomains = [ ];
    system.stateVersion = "23.05";
  };
in rec {
  bee.system = "x86_64-linux";
  bee.pkgs = import inputs.nixos {
    inherit (inputs.nixpkgs) system;
    config.allowUnfree = true;
  };
  imports = [
    init
    cell.hardwareProfiles.nephos
    cell.nixosSuites.base
    cell.nixosSuites.nc-server
  ];
}
