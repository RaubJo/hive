let inherit (cell) homeSuites homeProfiles;
in {
  shell = with homeProfiles; [ starship fish alacritty ];
  shellUtils = with homeProfiles; [ exa lf pass git bat feh ];
  xmonad = with homeProfiles; [ xmonad xmobar rofi gui ];
  sway = with homeProfiles; [ sway foot waybar ];
  hyprland = with homeProfiles; [ hyprland ];
  emacs = [ homeProfiles.emacs ];
  system = with homeProfiles; [
    systemProfile
    keyboardLayouts
    email
    packages
    qutebrowser
  ];
  gnome = with homeProfiles; [ dconf ];

  ## NixOS importable Suites ##
  joseph = with homeSuites;
    [ ] ++ shell ++ shellUtils ++ system ++ emacs ++ xmonad;
}
