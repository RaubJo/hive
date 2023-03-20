{ pkgs, ... }:
{
  home.packages = with pkgs; [
    rustc
    rustfmt
    cargo
  ];
}
