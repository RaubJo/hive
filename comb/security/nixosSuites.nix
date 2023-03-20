{ inputs, cell, }:
let
  inherit (cell) nixosModules;
in
rec {
  default = with nixosModules; [ firewall polkit ];
  tpm2 = with nixosModules; [ tpm2 ] ++ default;
}
