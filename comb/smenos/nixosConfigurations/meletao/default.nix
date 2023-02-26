{ inputs, cell, }:
let
  init = { config, pkgs, lib, ... }: {
    imports = [
      cell.hardwareProfiles.meletao
      cell.nixosSuites.base
      cell.nixosSuites.nvidia
      cell.nixosSuites.laptop
      cell.nixosSuites.thinkpad
      cell.nixosSuites.xmonad
      #cell.nixosSuites.hyprland
      cell.nixosProfiles.hello
    ];
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
    systemd.services.hello.enable = true;
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
    sound.enable = true;
    hardware = {
      enableRedistributableFirmware = lib.mkDefault true;
      video.hidpi.enable = lib.mkDefault true;
      bluetooth = {
        enable = true;
        package = pkgs.bluez;
      };
      pulseaudio.enable = true;
      nvidia.powerManagement.enable = true;
      cpu.intel = {
        updateMicrocode = true;
        sgx.provision.enable = true;
      };
    };
    security.polkit.enable = true;
    virtualisation.libvirtd.enable = true;
    programs.dconf.enable = true;
    system.stateVersion = "23.05";
  };

  discordASAR = self: super: {
    discord = super.discord.override { withOpenASAR = true; };
  };
in rec {
  bee.system = "x86_64-linux";
  bee.home = inputs.home;
  bee.pkgs = import inputs.nixos {
    inherit (inputs.nixpkgs) system;
    config.allowUnfree = true;
    overlays = [ inputs.hyprland.overlays.default discordASAR ];
  };
  imports = [
    bee.home.nixosModules.home-manager
    init
    #inputs.agenix.nixosModules.default
  ] ++ [{
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    home-manager.users.joseph = {
      imports = [ cell.homeConfigurations.joseph inputs.doom-emacs.hmModule ];
      home.stateVersion = "23.05";
    };
  }];
}
