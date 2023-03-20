{ config, ... }: {
  networking = {
    networkmanager = {
      enable = true;
      # https://unix.stackexchange.com/questions/22367/where-are-networkmanagers-wifi-settings-stored
    };
  };
}
