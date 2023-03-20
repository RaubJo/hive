{ inputs, cell, pkgs, ... }:

{
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraPackages = with pkgs; [
      xwayland
      gsettings-desktop-schemas
      autotiling
      wev
    ];
    services.xserver.displayManager.defaultSession = "sway";
  };
}
