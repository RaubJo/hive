{ config, lib, ... }: {
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

}
