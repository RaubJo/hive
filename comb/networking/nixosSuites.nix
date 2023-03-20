let
  inherit (cell) nixosModules;
in
{
  default = with nixosModules; [ wpa-networks ];
  secure = with nixosModules; [ networks ];
  tablet = with nixosModules; [ nm-networks ];
}
