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
      # cell.homeConfigurations.joseph
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
      #  cpu.intel = {
      #   updateMicrocode = true;
      # sgx.provision = {
      #   enable = true;
      #   user = "root";
      #   group = "sgx_prov";
      #   mode = "0660";
      # };
      # };
    };
    virtualisation.libvirtd.enable = true;
    programs.dconf.enable = true;
    system.stateVersion = "22.11";
  };

  #   nephos = { config, pkgs, lib, ... }: {
  #     bee.system = "x86_64-linux";
  #     bee.pkgs = import inputs.nixos {
  #       inherit (inputs.nixpkgs) system;
  #       config.allowUnfree = true;
  #       overlays = [ ];
  #     };
  #     imports = [ cell.nixosSuites.base cell.nixosSuites.server ];
  #   };
  #   kouphizo = { config, pkgs, lib, ... }: {
  #     bee.system = "aarch64-linux";
  #     bee.pkgs = import inputs.nixos {
  #       inherit (inputs.nixpkgs) system;
  #       config.allowUnfree = true;
  #       overlays = [ ];
  #     };
  #     imports = [
  #       cell.nixosSuites.base
  #       #cell.nixosSuites.
  #     ];
  #   };
  #   thureos = { config, pkgs, lib, ... }: {
  #     bee.system = "armv7-linux";
  #     imports = [ cell.nixosSuites.base ];
  #   };
  #   kerugma = { config, pkgs, lib, ... }: {
  #     bee.system = "x86_64-linux";
  #     bee.pkgs = import inputs.nixos {
  #       inherit (inputs.nixpkgs) system;
  #       config.allowUnfree = true;
  #       overlays = [ ];
  #     };
  #     imports = [ cell.nixosSuites.base cell.nixosSuites.mobile ];
  #   };
}
