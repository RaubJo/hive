{ config, pkgs, ... }:

{
  fonts = {
    fonts = with pkgs; [ noto-fonts liberation_ttf dejavu_fonts nerdfonts ];
    enableGhostscriptFonts = true;

    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [ "Noto Sans Mono Regular" ];
        sansSerif = [ "Noto Sans Display Regular" ];
        serif = [ "Noto Serif Regular" ];
      };
    };
  };
}
