{ inputs, cell }:
let
  inherit (inputs) nixpkgs;
  home = rec {
    homeDirectory = "/home/${username}";
    username = "joseph";
    packages = [ nixpkgs.nix ];
    sessionVariables = { EDITOR = "nvim"; };
  };

  manual = {
    manpages.enable = false;
    html.enable = false;
    json.enable = false;
  };
in
{
  default = {
    inherit home manual;
    imports = [ ]
      ++ inputs.cells.terminal.homeSuites.default
      ++ inputs.cells.terminal.homeSuites.default-themes
      ++ inputs.cells.applications.homeSuites.default
      ++ inputs.cells.gui.homeSuites.xmonad
      ++ inputs.cells.emacs.homeSuites.emacs
      ++ inputs.cells.development.homeSuites.all
      ++ inputs.cells.applications.homeSuites.default;
  };

  default-arm = {
    inherit manual;
    imports = [ ];
    targets.genericLinux.enable = true;
  };
}
