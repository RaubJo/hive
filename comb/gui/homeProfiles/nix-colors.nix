{ inputs, cell }:
let
  inherit (inputs) nix-colors nixpkgs;
in
{
  colorScheme = nix-colors.colorSchemes.nord;
}
