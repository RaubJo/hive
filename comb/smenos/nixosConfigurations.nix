{
  meletao = { config, pkgs, lib, ... }: rec {
    bee.system = "x86_64-linux";
    bee.home = inputs.home;
    bee.pkgs = import inputs.nixos {
      inherit (inputs.nixpkgs) system;
      config.allowUnfree = true;
      overlays = [ ];
    };
    imports = [
      cell.hardwareProfiles.meletao
      cell.nixosSuites.base
      cell.nixosSuites.laptop
      cell.nixosSuites.xmonad
    ];
    # ++ [ bee.home.nixosModules.home-manager ] ++ [{
    #   home-manager.useUserPackages = true;
    #   home-manager.useGlobalPkgs = true;
    #   home-manager.users.joseph = {
    #     imports = [ cell.homeConfigurations.joseph ];
    #   };
    # }];
    boot = {
      #kernelPackages = pkgs.linuxPackages_latest;
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
    virtualisation.libvirtd.enable = true;
    programs.dconf.enable = true;
    system.stateVersion = "22.11";
  };

  nephos = { config, pkgs, lib, ... }: {
    bee.system = "x86_64-linux";
    bee.pkgs = import inputs.nixos {
      inherit (inputs.nixpkgs) system;
      config.allowUnfree = true;
      overlays = [ ];
    };

    boot.loader.grub.enable = true;
    boot.loader.grub.device = "/dev/sda";
    boot.loader.grub.useOSProber = true;

    networking.hostName = "nephos";
    services.getty.autologinUser = "joseph";
    services.nextcloud.config.extraTrustedDomains = [ ];
    imports = [
      cell.hardwareProfiles.nephos
      cell.nixosSuites.base
      cell.nixosSuites.server
    ];
    system.stateVersion = "22.11";
  };

  kouphizo = { config, pkgs, lib, ... }: {
    bee.system = "aarch64-linux";
    bee.pkgs = import inputs.nixos {
      inherit (inputs.nixpkgs) system;
      config.allowUnfree = true;
      overlays = [ ];
    };
    imports = [
      cell.hardwareProfiles.kouphizo
      cell.nixosSuites.base
      cell.nixosSuites.ephemeral
      cell.nixosSuites.xmonad
    ];
    system.stateVersion = "22.11";
  };

  # thureos = { config, pkgs, lib, ... }: {
  #   bee.system = "armv7-linux";
  #   imports = [ cell.nixosSuites.base ];
  # };

  kerugma = { config, pkgs, lib, ... }: {
    bee.system = "x86_64-linux";
    bee.pkgs = import inputs.nixos {
      inherit (inputs.nixpkgs) system;
      config.allowUnfree = true;
      overlays = [ ];
    };
    imports = [
      cell.hardwareProfiles.kerugma
      cell.nixosSuites.base
      cell.nixosSuites.mobile
    ];

    boot.loader = {
      systemd-boot.enable = true;
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
    };

    networking.hostName = "kerugma";

    system.stateVersion = "22.05";

  };
}
