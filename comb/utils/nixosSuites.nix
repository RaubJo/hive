{ cell }:
let
  inherit (cell) nixosModules;
in
rec
{
  default = with nixosModules; [
    fonts
    locale
    nix
    ssh
    gpg
  ];

  light = with nixosModules; [
    zram
    minify
  ] ++ default;
}
