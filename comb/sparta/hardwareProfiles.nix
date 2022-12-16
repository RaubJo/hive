{
  meletao = { pkgs, config, lib, ... }: {
    imports = [
      #      inputs.disko.nixosModules.disko
      #      { disko.devices = cell.diskoConfigurations.meletao; }
      #      inputs.nixos-hardware.nixosModules.lenovo-thinkpad-p50
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

    networking.useDHCP = lib.mkDefault true;
    powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
    hardware.cpu.intel.updateMicrocode =
      lib.mkDefault config.hardware.enableRedistributableFirmware;
  };
}
