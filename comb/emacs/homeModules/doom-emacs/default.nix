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

  home.packages = with pkgs; [
    coreutils
    ripgrep
    fd
    ispell
    libvterm
    sqlite
    languagetool
    ledger
    shellcheck
  ];

}
