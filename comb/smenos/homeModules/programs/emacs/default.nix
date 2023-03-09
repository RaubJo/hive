{ pkgs, ... }:

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
        slack
      ];
  };

}
