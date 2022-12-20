{ config, lib, pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    font = "Monospace 12";
    theme = "gruvbox-light-soft";
    pass = {
      enable = true;
      stores = [ "~/.password-store" ];
    };
  };
}
