{ config, lib, ... }: {
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
}
