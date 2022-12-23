{ config, lib, pkgs, ... }:

{

  wayland.windowManager.sway = {
    enable = true;
    #extraPackages = with pkgs; [ xwayland gsettings_desktop_schemas ];
    #  config = {
    #    assigns = { };
    #    bars = [ ];

    #  };
  };
}
