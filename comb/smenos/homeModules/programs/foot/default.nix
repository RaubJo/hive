{ pkgs, ... }: {
  programs.foot = {
    enable = true;
    server.enable = false;
    package = pkgs.foot;
  };
}
