{ inputs, cell, }:
let
  init = { config, pkgs, lib, ... }: {
    imports = [
      cell.hardwareProfiles.kouphizo
      cell.nixosSuites.base
      cell.nixosSuites.laptop
      cell.nixosSuites.hyprland
    ];
    boot.kernelPackages = pkgs.linuxPackages_latest;
    networking = {
      hostName = "kouphizo";
      interfaces.wlan0.useDHCP = true;
      wireless.interfaces = [ "wlan0" ];
      nameservers = [ "192.168.1.5" "100.95.211.76" "1.1.1.1" "8.8.8.8" ];
    };
    sound.enable = true;
    hardware = {
      enableRedistributableFirmware = lib.mkDefault true;
      bluetooth.enable = true;
      pulseaudio.enable = true;
    };
    system.stateVersion = "23.05";
  };
in rec {
  bee.system = "aarch64-linux";
  bee.home = inputs.home;
  bee.pkgs = import inputs.nixos {
    inherit (inputs.nixpkgs) system;
    config.allowUnfree = true;
    overlays = [ inputs.hyprland.overlays.default ];
  };
  imports = [ bee.home.nixosModules.home-manager init ] ++ [{
    home-manager.useUserPackages = true;
    home-manager.useGlobalPkgs = true;
    home-manager.users.joseph = {
<<<<<<< HEAD
      imports =
        [ cell.homeConfigurations.joseph-arm inputs.doom-emacs.hmModule ];
=======
      imports = [
        cell.homeConfigurations.joseph-arm
        #inputs.hyprland.homeManagerModules.default
      ];
>>>>>>> origin/master
      home.stateVersion = "23.05";
    };
  }];
}
