let
  inherit (cell) nixosModules;
in
{
  default = with nixosModules; [ default ];
  #tablet = with nixosModules; [ tablet ];
  server = with nixosModules; [ kurios ];
}
