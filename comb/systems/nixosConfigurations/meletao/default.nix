{ inputs, cell, }:
let
  version = "23.05";
in
let
  init = { pkgs, ... }: {
    imports = [
      cell.hardwareProfiles.meletao
      #    cell.nixosSuites.base
      #    cell.nixosSuites.nvidia
      #    cell.nixosSuites.laptop
      #    cell.nixosSuites.thinkpad
      #    cell.nixosSuites.xmonad
      #cell.nixosSuites.hyprland
    ] ++ cell.nixosSuites.lenovo-p50;

    boot.binfmt.emulatedSystems = [ "aarch64-linux" ];
    boot = {
      kernelPackages = pkgs.linuxPackages_latest;
      loader = {
        systemd-boot.enable = true;
        systemd-boot.consoleMode = "max";
        efi = {
          canTouchEfiVariables = true;
          efiSysMountPoint = "/boot";
        };
      };
    };
    networking = {
      hostName = "meletao";
      interfaces.enp0s31f6.useDHCP = true;
      interfaces.wlp4s0.useDHCP = true;
      wireless.interfaces = [ "wlp4s0" ];
      nameservers = [ "192.168.1.5" "100.95.211.76" "1.1.1.1" "8.8.8.8" ];
    };
    services.xserver.displayManager.defaultSession = "none+xmonad";
    environment.systemPackages = with pkgs; [ arandr ];
    services = {
      pcscd.enable = true;
      udisks2.enable = true;
    };
    virtualisation.libvirtd.enable = true;
    programs.dconf.enable = true;
    system.stateVersion = version;
  };
in
rec {
  bee.system = "x86_64-linux";
  bee.home = inputs.home;
  bee.pkgs = import inputs.nixos {
    inherit (inputs.nixpkgs) system;
    config.allowUnfree = true;
    overlays = [
      #inputs.hyprland.overlays.default
      inputs.cells.overlays.nixosModules.discordASAR
    ];
  };
  imports = [
    bee.home.nixosModules.home-manager
    init
    inputs.agenix.nixosModules.default
  ] ++ [{
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    home-manager.users.joseph = {
      imports = [ inputs.cells.homes.homeConfigurations.default ];
      home.stateVersion = version;
    };
  }];
}
