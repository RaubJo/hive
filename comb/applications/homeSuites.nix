let
  inherit (cell) homeModules homeProfiles;
in
{
  default = with homeModules; [ alacritty qutebrowser rofi feh email gui home-manager keyboard packages picom services ]
    ++ [ homeProfiles.alacritty homeProfiles.qutebrowser ];
}
