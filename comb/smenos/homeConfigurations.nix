let
  inherit (cell) homeSuites homeProfiles;
  inherit (inputs) nixos;

  bee = {
    system = "x86_64-linux";
    inherit (inputs) home;
    pkgs = inputs.nixos.legacyPackages;
  };

  home = rec {
    homeDirectory = "/home/${username}";
    stateVersion = "23.05";
    username = "joseph";
    sessionVariables = { EDITOR = "nvim"; };
    keyboard = {
      layout = "us,gr,il,th";
      variant = ",polytonic,biblical,";
      options = [ "grp:alt_shift_toggle" ];
    };
  };

  manual = {
    manpages.enable = false;
    html.enable = false;
    json.enable = false;
  };
in {
  joseph = { config, ... }: {
    inherit manual;
    imports = with homeSuites;
      [ ] ++ system ++ xmonad ++ emacs ++ shell ++ shellUtils;
  };
  joseph-arm = { pkgs, config, lib, ... }: {
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
