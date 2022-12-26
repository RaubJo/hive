{ config, lib, pkgs, ... }:

{

  wayland.windowManager.sway = {
    enable = true;
    config = rec {
      modifier = "Mod4";
      terminal = "foot";

    };
    #extraPackages = with pkgs; [ xwayland gsettings_desktop_schemas ];
    #  config = {
    #    assigns = { };
    #    bars = [ ];

    #  };
  };
}
