let
  inherit (cell) nixosModules;
in
{

  default = with nixosModules; [ ];
  zfs = with nixosModules; [ zfs ];
}
