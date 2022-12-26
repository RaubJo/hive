{
  meletao = { pkgs, config, lib, ... }: {
    imports = [
      # inputs.disko.nixosModules.disko
      # { disko.devices = cell.diskoConfigurations.meletao; }
      # inputs.nixos-hardware.nixosModules.lenovo-thinkpad-p50
    ];
    boot.initrd = {
      availableKernelModules = [
        "xhci_pci"
        "ahci"
        "usbhid"
        "usb_storage"
        "uas"
        "sd_mod"
        "sr_mod"
        "rtsx_pci_sdmmc"
      ];
      kernelModules = [ "nvme" "kvm-intel" "coretemp" ];
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

  kouphizo = { config, lib, ... }: {
    boot.loader.grub.enable = false;
    boot.loader.generic-extlinux-compatible.enable = true;
    boot.initrd.availableKernelModules = [ "usb_storage" "usbhid" ];
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [ ];
    boot.extraModulePackages = [ ];
    networking.hostId = "1c3833fb";
    fileSystems = {
      "/" = {
        device = "rpool/ephemeral/root";
        fsType = "zfs";
      };
      "/nix" = {
        device = "rpool/ephemeral/nix";
        fsType = "zfs";
      };
      "/home" = {
        device = "rpool/persistent/home";
        fsType = "zfs";
      };
      "/state" = {
        device = "rpool/persistent/state";
        fsType = "zfs";
      };
      "/boot" = {
        device = "/dev/disk/by-uuid/E40C-DB1A";
        fsType = "vfat";
      };
      "/mnt/sdcard" = {
        device = "/dev/disk/by-uuid/c4bbc3ff-9ee6-4a34-b536-2040105c3998";
        fsType = "ext4";
      };
    };
    powerManagement.cpuFreqGovernor = "ondemand";
  };

  kerugma = { config, pkgs, lib, ... }: {
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

  thureos = { config, pkgs, lib, ... }: { };
  tamieion = { config, pkgs, lib, ... }: { };
}
