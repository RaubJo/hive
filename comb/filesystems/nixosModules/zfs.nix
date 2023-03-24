{ lib, ... }: {
  boot.initrd.postDeviceCommands = lib.mkAfter ''
    zfs rollback -r rpool/local/root@blank
  '';
  services.zfs = {
    autoScrub.enable = true;
    autoSnapshot.enable = true;
  };
}
