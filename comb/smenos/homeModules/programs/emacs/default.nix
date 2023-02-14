{ config, lib, pkgs, ... }:

{
  programs.emacs = {
    enable = true;
    #package = pkgs.emacs28NativeComp;
    extraPackages = epkgs: [ epkgs.vterm epkgs.phpactor epkgs.composer ];
  };

}
