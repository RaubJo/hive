let
  inherit (cell) homeSuites;

  manual = {
    manpages.enable = false;
    html.enable = false;
    json.enable = false;
  };
in {
  joseph = { ... }: {
    inherit manual;
    imports = with homeSuites;
      [ ] ++ system ++ xmonad ++ emacs ++ shell ++ shellUtils;
  };
  joseph-arm = { ... }: {
    inherit manual;
    targets.genericLinux.enable = true;
    imports = with homeSuites;
      [ ] ++ system ++ shell ++ shellUtils ++ emacs ++ hyprland;
  };

  #   server = {
  #     inherit bee home manual;
  #     targets.genericLinux.enable = true;
  #     imports = with homeSuites; [ ] ++ system ++ shell;
  #     # ++ nameOfSuite;
  #   };
}
