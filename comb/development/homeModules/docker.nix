{ pkgs, ... }: {
  home.packages = with pkgs; [
    nodejs
    nodePackages.npm
    nodePackages.dockerfile-language-server-nodejs
  ];
}
