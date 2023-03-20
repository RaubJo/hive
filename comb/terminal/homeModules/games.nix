{ pkgs, ... }:
{
  home.packages = with pkgs; [
    rogue
    nethack
    harmonist
    crawl
  ];
}
