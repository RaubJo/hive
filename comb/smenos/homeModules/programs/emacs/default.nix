{ config, lib, pkgs, ... }:

{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs28NativeComp;
    extraPackages = epkgs:
      with epkgs; [
        vterm
        phpactor
        composer
        phpunit
        lsp-tailwindcss
        slack
      ];
  };

}
