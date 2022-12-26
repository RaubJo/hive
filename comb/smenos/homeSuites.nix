let inherit (cell) homeSuites homeProfiles;
in {
  shell = with homeProfiles; [ starship fish alacritty ];
  shellUtils = with homeProfiles; [ exa lf pass git bat feh ];
  xmonad = with homeProfiles; [ xmonad xmobar rofi gui ];
  sway = with homeProfiles; [ sway foot waybar ];
  emacs = [ homeProfiles.emacs ];
  system = with homeProfiles; [ systemProfile email packages qutebrowser ];

  joseph = with homeProfiles;
    [
      starship
      fish
      alacritty
      exa
      lf
      pass
      git
      bat
      feh

      emacs
      systemProfile
      email
      packages
      qutebrowser
    ] ++ homeSuites.xmonad;
}
