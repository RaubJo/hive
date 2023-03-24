{ inputs, cell }:
let
  inherit (inputs) nix-colors;
in
{
  imports = [ nix-colors.homeManagerModule ];
  colorScheme = nix-colors.colorSchemes.nord;
}
