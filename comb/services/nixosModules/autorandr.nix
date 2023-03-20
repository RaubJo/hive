{ config, pkgs, ... }: {
  services.autorandr = {
    enable = true;
    #defaultTarget = "mobile";
    #      hooks.postswitch = {
    #        "notify" = "";
    #        "change-background" =
    #          "${pkgs.feh}/bin/feh --randomize --bg-fill /home/${config.user}/.wallpapers/";
    #      };
    profiles = {
      "mobile" = {
        fingerprint = {
          eDP-1-1 =
            "00ffffffffffff004d103b140000000024190104a523137806df50a35435b5260f5054000000010101010101010101010101010101014dd000a0f0703e80302035005ac210000018000000100000000000000000000000000000000000100000000000000000000000000000000000fe004c5131353644314a5730350a200026";
        };
        config = {
          eDP-1-1 = {
            enable = true;
            primary = true;
            position = "0x0";
            mode = "1920x1080";
            rate = "60.00";
            rotate = "normal";
          };
          "DP-3.2".enable = false;
        };
      };
      "docked" = {
        fingerprint = {
          eDP-1-1 =
            "00ffffffffffff004d103b140000000024190104a523137806df50a35435b5260f5054000000010101010101010101010101010101014dd000a0f0703e80302035005ac210000018000000100000000000000000000000000000000000100000000000000000000000000000000000fe004c5131353644314a5730350a200026";
          "DP-3.2" =
            "00ffffffffffff0010ac72f049474c412f19010380301b78ea8ef5a25750a2270c5054a54b00d1c08180a9c0714f0101010101010101023a801871382d40582c4500dc0c1100001e000000ff00364652434835424a414c47490a000000fc0044454c4c53453232313648560a000000fd00384c1e5311000a202020202020015a02031b71230907078301000067030c002000802d43100403e2000f8c0ad08a20e02d10103e9600a05a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000018";
        };
        config = {
          eDP-1-1 = {
            enable = true;
            mode = "1920x1080";
            position = "1080x0";
            primary = true;
            rate = "60.00";
            rotate = "normal";
          };
          "DP-3.2" = {
            enable = true;
            primary = false;
            mode = "1920x1080";
            position = "0x0";
            rotate = "left";
            rate = "60.00";
          };
        };
      };
    };
  };
}
