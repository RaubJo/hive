{ inputs, cell, }:
let
  version = "23.05";
  init = { config, pkgs, lib, ... }: {
    imports = [
      cell.hardwareProfiles.kouphizo
      #TODO: Determine which modules to import
      #cell.nixosSuites.base, laptop, hyprland
    ];

    boot.kernelPackage = pkgs.linuxPackages_latest;
    networking = {
      hostname = "kouphizo";
      interfaces.wlan0.useDHCP = true;
      wireless.interfaces = [ "wlan0" ];
      nameservers = [
        "192.168.1.5" # PiHole
        "100.95.211.76" # PiHole via tailscale
        "1.1.1.1" # Cloudflare DNS
        "8.8.8.8" # Google DNS
      ];
    };
    system.stateVersion = ${version};
  };
in
rec {
  bee.system = "aarch64-linux";
  bee.home = inputs.home;
  bee.pkgs = import inputs.nixos {
    inherit (inputs.nixpkgs) system;
    config.allowUnfree = true;
    overlays = [ ];
  };
  imports = [ bee.home.nixosModules.home-manager init ] ++ [{
    home-manager.useUserPackages = true;
    home-manager.useGlobalPkgs = true;
    home-manager.users.joseph = {
      imports = [
        inputs.cells.homes.homeConfigurations.default-arm
        #inputs.doom-emacs.homeModule
      ];
      home.stateVersion = ${version};
    };
  }];
}
