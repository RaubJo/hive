{ inputs, cell, }:
let
  init = { config, pkgs, lib, ... }: {
    boot.loader.grub = {
      enable = true;
      devices = [ "/dev/sda" ];
      useOSProber = true;
    };

    networking.hostName = "tamieion";
    services.getty.autologinUser = "kurios";
    services.nextcloud.config.extraTrustedDomains =
      [ "192.168.0.2" "100.67.46.42" ];
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
    cell.hardwareProfiles.tamieion
    cell.nixosSuites.base
    cell.nixosSuites.nc-server
  ];
}
