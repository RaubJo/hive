{
  meletao = { config, lib, ... }: {
    imports = [
      # inputs.disko.nixosModules.disko
      # { disko.devices = cell.diskoConfigurations.meletao; }
      # inputs.nixos-hardware.nixosModules.lenovo-thinkpad-p50
    ];
    boot = {
      initrd = {
        availableKernelModules = [
          "xhci_pci"
          "ahci"
          "usbhid"
          "usb_storage"
          "uas"
          "sd_mod"
          "sr_mod"
          "rtsx_pci_sdmmc"
          "nvidia"
          "nvidia_modeset"
          "nvidia_uvm"
          "nvidia_drm"
        ];
        kernelModules = [ "nvme" "kvm-intel" "coretemp" ];
      };
      kernelModules = [ "nvme" "kvm-intel" "coretemp" "nvidia-dkms" ];
    };
    fileSystems = {
      "/" = {
        device = "/dev/disk/by-uuid/0f96add3-bed4-4d4a-b400-85a1e615971d";
        fsType = "ext4";
      };
      "/boot" = {
        device = "/dev/disk/by-uuid/869E-504F";
        fsType = "vfat";
      };
    };
    swapDevices = [{ device = "/dev/disk/by-label/swap"; }];
    networking.useDHCP = lib.mkDefault true;
    powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
    hardware.cpu.intel.updateMicrocode =
      lib.mkDefault config.hardware.enableRedistributableFirmware;
  };

  nephos = { config, lib, ... }: {
    boot.initrd.availableKernelModules =
      [ "xhci_pci" "ehci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" "sr_mod" ];
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [ "kvm-intel" ];
    boot.extraModulePackages = [ ];
    fileSystems."/" = {
      device = "/dev/disk/by-uuid/917b7ce0-807f-47b6-b31d-0b9c7f767f2e";
      fsType = "ext4";
    };
    swapDevices = [ ];
    networking.useDHCP = lib.mkDefault true;
    hardware.cpu.intel.updateMicrocode =
      lib.mkDefault config.hardware.enableRedistributableFirmware;
  };

  kouphizo = { lib, ... }: {
    boot.loader.grub.enable = false;
    boot.loader.generic-extlinux-compatible.enable = true;
    boot.initrd.availableKernelModules = [ "usb_storage" "usbhid" ];
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [ ];
    boot.extraModulePackages = [ ];
    fileSystems = {
      "/" = {
        device = "/dev/disk/by-uuid/489b7814-fd16-46f1-a42c-2b60d2092848";
        fsType = "ext4";
      };
      "/boot" = {
        device = "/dev/disk/by-uuid/AAC2-6526";
        fsType = "vfat";
      };
    };
    swapDevices =
      [{ device = "/dev/disk/by-uuid/ef7d7629-20c6-4797-9b3c-b9a68623cd23"; }];

    nixpkgs.hostPlatform = lib.mkDefault "aarch64-linux";
    powerManagement.cpuFreqGovernor = lib.mkDefault "ondemand";
  };

  kerugma = { config, lib, ... }: {
    boot.initrd.availableKernelModules =
      [ "xhci_pci" "nvme" "usb_storage" "usbhid" "sd_mod" "rtsx_pci_sdmmc" ];
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [ "kvm-intel" ];
    boot.extraModulePackages = [ ];
    fileSystems."/" = {
      device = "/dev/disk/by-uuid/ef2ad2a4-9b9a-4385-a7eb-5aa3ef439226";
      fsType = "ext4";
    };
    fileSystems."/boot/efi" = {
      device = "/dev/disk/by-uuid/64E2-FB3C";
      fsType = "vfat";
    };
    swapDevices = [ ];
    hardware.sensor.iio.enable = true;
    hardware.bluetooth.enable = true;
    networking.useDHCP = lib.mkDefault true;
    powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
    hardware.cpu.intel.updateMicrocode =
      lib.mkDefault config.hardware.enableRedistributableFirmware;
  };

  thureos = { ... }: { };
  tamieion = { config, lib, ... }: {
    boot.initrd.availableKernelModules = [
      "ehci_pci"
      "ahci"
      "firewire_ohci"
      "usbhid"
      "usb_storage"
      "sd_mod"
      "sr_mod"
    ];
    boot.supportedFilesystems = [ "ntfs" ];
    fileSystems."/" = {
      device = "/dev/disk/by-uuid/41d0177e-ac04-420d-b9c9-b383054d299a";
      fsType = "ext4";
    };

    swapDevices =
      [{ device = "/dev/disk/by-uuid/54483d79-c23e-4379-ae74-b4467457cf32"; }];

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    hardware.cpu.intel.updateMicrocode =
      lib.mkDefault config.hardware.enableRedistributableFirmware;

  };
}
