{ config, lib, ... }: {
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
        #"rtsx_pci_sdmmc"
        #"nvidia"
        #"nvidia_modeset"
        #"nvidia_uvm"
        #"nvidia_drm"
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
}
