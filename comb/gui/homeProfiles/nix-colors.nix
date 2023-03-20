{ inputs, cell }:
let
  inherit (inputs) nix-colors nixpkgs;
in
{
  imports = [ nix-colors.homeManagerModule ];
  colorScheme = nix-colors.colorSchemes.nord;
}
