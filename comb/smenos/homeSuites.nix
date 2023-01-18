let inherit (cell) homeSuites homeProfiles;
in {
  shell = with homeProfiles; [ starship fish alacritty ];
  shellUtils = with homeProfiles; [ exa lf pass git bat feh ];
  awesome = with homeProfiles; [ awesome picom ];
  money = with homeProfiles; [ ledger ];
  xmonad = with homeProfiles; [ xmonad xmobar rofi gui picom ];
  sway = with homeProfiles; [ sway foot waybar gui ];
  hyprland = with homeProfiles; [ hyprland waybar gui ];
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
    [ ] ++ shell ++ shellUtils ++ system ++ emacs ++ money ++ xmonad;
  josephAwesome = with homeSuites;
    [ ] ++ shell ++ shellUtils ++ system ++ emacs ++ money ++ awesome;
  josephSway = with homeSuites;
    [ ] ++ shell ++ shellUtils ++ system ++ emacs ++ money ++ sway;
}
