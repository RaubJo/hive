let
  inherit (cell) homeModules;
in
{
  emacs = with homeModules; [ emacs ];
  doom = with homeModules; [ doom-emacs ];
}
