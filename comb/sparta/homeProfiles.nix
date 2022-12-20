let inherit (inputs) nix-colors nixpkgs;
in {

  # Shells and Prompts
  starship = import ./homeModules/programs/starship;
  fish = import ./homeModules/programs/fish;
  # bash

  # Terminals
  # uxterm
  alacritty = import ./homeModules/programs/alacritty;
  # tmux

  # Browsers
  qutebrowser = import ./homeModules/programs/qutebrowser;
  #  firefox
  #  google-chrome ? Why would I ?

  # Status Bars
  xmobar = import ./homeModules/programs/xmobar;
  # waybar
  # polybar

  # Window Managers
  xmonad = import ./homeModules/programs/xmonad;
  # awesome
  # i3
  # herbsulftwm
  # bspwm

  # Editors
  emacs = import ./homeModules/programs/emacs;
  neovim = import ./homeModules/programs/neovim;
  #  doom-emacs = import ./homeModules/programs/doom-emacs;

  # Utils
  exa = import ./homeModules/programs/exa;
  lf = import ./homeModules/programs/lf;
  pass = import ./homeModules/programs/pass;
  git = import ./homeModules/programs/git;
  bat = import ./homeModules/programs/bat;
  feh = import ./homeModules/programs/feh;
  zathura = import ./homeModules/programs/zathura;

  # Services
  services = import ./homeModules/services.nix;

  # Launcher
  rofi = import ./homeModules/programs/rofi;

  # Misc
  email = import ./homeModules/email.nix;
  gui = import ./homeModules/gui.nix;
  packages = import ./homeModules/packages.nix;

  systemProfile = {
    imports = [ nix-colors.homeManagerModule ];
    colorScheme = nix-colors.colorSchemes.nord;
    home.packages = [ nixpkgs.nix ];
    programs.home-manager.enable = true;
    nix = { package = nixpkgs.nix; };
  };

}
