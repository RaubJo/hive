{ pkgs, ... }: {
  home.packages = with pkgs; [
    nodePackages.bash-language-server
  ];
}
