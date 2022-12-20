{ config, lib, pkgs, ... }:

{
  programs.lf = {
    enable = true;
    settings = {
      drawbox = true;
      relativenumber = true;
      preview = true;
      color256 = true;
    };
  };
}
