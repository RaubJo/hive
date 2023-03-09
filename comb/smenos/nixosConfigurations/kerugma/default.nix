{ inputs, cell, }:
let
  init = { pkgs, ... }: {
    imports = [
      cell.hardwareProfiles.kerugma
      cell.nixosSuites.base
      cell.nixosSuites.tablet
    ];

    boot.loader = {
      systemd-boot.enable = true;
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
    };

    networking.hostName = "kerugma";
    sound.enable = true;
    hardware.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    environment.systemPackages = with pkgs; [
      okular
      usbutils
      udiskie
      neovim
      wget
      git
      htop
      lshw
      iio-sensor-proxy
      surface-control
      iptsd
    ];

    services = {
      openssh.enable = true;
      udisks2.enable = true;
      touchegg.enable = true;
      unclutter.enable = true;
      unclutter.timeout = 1;
    };

    system.stateVersion = "23.05";
  };
in rec {
  bee.system = "x86_64-linux";
  bee.home = inputs.home;
  bee.pkgs = import inputs.nixos {
    inherit (inputs.nixpkgs) system;
    config.allowUnfree = true;
  };
  imports = [ bee.home.nixosModules.home-manager init ] ++ [{
    home-manager.useUserPackages = true;
    home-manager.useGlobalPkgs = true;
    home-manager.users.joseph = {
      imports = [ ] ++ cell.homeSuites.gnome;
      home.stateVersion = "23.05";
    };
  }];
}
