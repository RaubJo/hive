let
  inherit (cell) nixosModules;
in
{
  git-server = with nixosModules; [ git ];
}
