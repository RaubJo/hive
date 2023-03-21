{ config, ... }: {
  networking = {
    networkmanager.enable = false;
    wireless = {
      enable = true;
      userControlled.enable = true;
      userControlled.group = "wheel";
      environmentFile = config.age.secrets.wireless-env.path;
      networks = {
        "dalabarge-5G2" = {
          psk = "@PSK_dalabarge@";
        };
        "WRT300N-DD" = {
          psk = "@PSK_WRT300NDD@";
        };
        FTCNWKS = {
          psk = "@PSK_FTCNWKS@";
        };
        Phone = {
          psk = "@PSK_Phone@";
          priority = 5;
        };
        NHBC = {
          psk = "@PSK_NHBC@";
          priority = 4;
        };
        NETGEAR09 = {
          psk = "@PSK_NETGEAR095G@";
        };
        NETGEAR09-5G = {
          psk = "@PSK_NETGEAR095G@";
          priority = 4;
        };
        RAUB = {
          psk = "@PSK_RAUB@";
        };
        Raub = {
          psk = "@PSK_Raub@";
        };
        Hearn = {
          psk = "@PSK_Hearn@";
        };
        SpectrumSetup-64 = {
          psk = "@PSK_SpectrumSetup64@";
        };
        "Southland Public" = {
          psk = "@PSK_SouthlandPublic@";
        };
        Here = {
          psk = "@PSK_Here@";
        };
        "4_Chips" = {
          psk = "@PSK_Chips@";
        };
      };
    };
  };
}
