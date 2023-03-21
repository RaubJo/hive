let
  inherit (cell) nixosModules;
  inherit (inputs.cells) agenix;
in
{
  default = with nixosModules; [ networks ] ++ agenix.nixosSuites.wpa-networks;
  tablet = with nixosModules; [ nm-networks ];
}
