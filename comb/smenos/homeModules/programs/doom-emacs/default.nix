{ config, lib, pkgs, ... }:

{
  programs.doom-emacs = {
    enable = true;
    emacsPackage = pkgs.emacs28NativeComp;
    extraPackages = epkgs:
      with epkgs; [
        vterm
        phpactor
        company-phpactor
        composer
        phpunit
        lsp-tailwindcss
        slack
      ];
    doomPrivateDir = ./doom.d;
  };
}
