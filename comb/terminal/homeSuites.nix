{ cell, }:
let inherit (cell) homeModules homeProfiles;
in
rec {
  default = with homeModules;
    [
      exa
      git
      ledger
      lf
      neovim
      pass
      starship
      fish
    ] ++ [ packages utils ];


  minimal = with homeModules; [ fish git neovim ];

  #TODO: craft profiles of anything with theming
  default-themes = with homeProfiles; [ bat ] ++ default;
}
