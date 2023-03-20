{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    cmake
    gnumake
    libtool
  ];
}
