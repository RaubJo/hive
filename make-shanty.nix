{
  nixpkgs,
  cellBlock ? "diskoConfigurations",
}: let
  inherit (import ./pasteurize.nix {inherit nixpkgs cellBlock;}) sing;
in
  sing
