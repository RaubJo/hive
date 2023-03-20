{ config, lib, pkgs, ... }:

{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs28NativeComp;
    extraPackages = epkgs:
      with epkgs; [
        vterm
        phpactor
        company-phpactor
        composer
        phpunit
        lsp-tailwindcss
        prettier
      ];
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
