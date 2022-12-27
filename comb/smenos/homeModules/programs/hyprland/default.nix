{ config, lib, pkgs, ... }:

{
  hyprland = {
    programs.hyprland.enable = true;
    services.xserver.displaymanager.defaultSession = "hyprland";
  };
}
