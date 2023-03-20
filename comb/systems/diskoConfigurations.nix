{
  meletao = {
    disko.devices = {
      disk.sdb = {
        device = "/dev/sdb";
        type = "disk";
        content = {
          type = "table";
          format = "gpt";
          partitions = [
            {
              type = "partition";
              name = "ESP";
              start = "1MiB";
              end = "100MiB";
              bootable = true;
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
              };
            }
            {
              type = "partition";
              name = "root";
              start = "100MiB";
              end = "-4G";
              part-type = "primary";
              bootable = true;
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
              };
            }
            {
              type = "partition";
              name = "swap";
              start = "-1G";
              end = "100%";
              part-type = "primary";
              content = {
                type = "swap";
                randomEncryption = true;
              };
            }
          ];
        };
      };
    };
  };
}
