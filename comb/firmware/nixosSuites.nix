let
  inherit (cell) nixosModules;
in
{
  default = with nixosModules; [ fwupd ];
}
