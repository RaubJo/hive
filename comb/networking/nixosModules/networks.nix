{ config, ... }: {
  networking = {
    networkmanager.enable = false;
    wireless = {
      enable = true;
      userControlled.enable = true;
      userControlled.group = "wheel";
      environmentFile = config.age.secrets.wireless-env.path;
      networks = {
        # "dalabarge-5G2" = {
        #   psk = builtins.readFile config.age.secrets.dalabarge.path;
        # };
        # "WRT300N-DD" = {
        #   psk = builtins.readFile config.age.secrets.WRT300N-DD.path;
        # };
        # FTCNWKS = {
        #   psk = builtins.readFile config.age.secrets.FTCNWKS.path;
        # };
        # Phone = {
        #   psk = builtins.readFile config.age.secrets.Phone.path;
        #   priority = 5;
        # };
        # NHBC = {
        #   psk = builtins.readFile config.age.secrets.NHBC.path;
        #   priority = 4;
        # };
        #NETGEAR09 = {
        #  psk = builtins.readFile config.age.secrets.NETGEAR09.path;
        #};
        NETGEAR09-5G = {
          psk = "@PSK_NETGEAR095G@";
          priority = 4;
        };
        # RAUB = {
        #   psk = builtins.readFile config.age.secrets.RAUB.path;
        # };
        # Raub = {
        #   psk = builtins.readFile config.age.secrets.Raub.path;
        # };
        # Hearn = {
        #   psk = builtins.readFile config.age.secrets.Hearn.path;
        # };
        # SpectrumSetup-64 = {
        #   psk = builtins.readFile config.age.secrets.SpectrumSetup-64.path;
        # };
        # "Southland Public" = {
        #   psk = builtins.readFile config.age.secrets.Southland_Public.path;
        # };
        # Here = {
        #   psk = builtins.readFile config.age.secrets.Here.path;
        # };
        #"4_Chips" = {
        #  psk = builtins.readFile config.age.secrets.Chips.path;
        #};
      };
    };
  };
}
