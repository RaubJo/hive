let
  inherit (inputs.cells) sparta;
  inherit (cell) homeProfiles homeModules;
in {
  shell = with homeProfiles; [ starship fish alacritty ];
  shellUtils = with homeProfiles; [ exa lf pass git bat feh ];
  gui = [ homeProfiles.gui ];
  xmonad = with homeProfiles; [ xmonad xmobar rofi ];
  emacs = [ homeProfiles.emacs ];
  system = with homeProfiles; [ systemProfile email packages qutebrowser ];
}
