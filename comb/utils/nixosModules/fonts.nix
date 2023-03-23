{ pkgs, ... }:
{
  fonts = {
    fonts = with pkgs; [
      #(nerdfonts.override { fonts = [ "SourceCodePro" "Mononoki" ]; })
      nerdfonts
      noto-fonts
      noto-fonts-emoji
      mplus-outline-fonts.githubRelease
      liberation_ttf
      dejavu_fonts
    ];
    enableGhostscriptFonts = true;
    enableDefaultFonts = true;
    fontconfig = {
      enable = true;
      hinting.style = "hintmedium";
      antialias = true;
      defaultFonts = {
        monospace = [ "Noto Sans Mono Regular" ];
        sansSerif = [ "Noto Sans Display Regular" ];
        serif = [ "Noto Serif Regular" ];
      };
    };
  };
}
