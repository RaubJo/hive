let inherit (inputs) nix-colors nixpkgs hyprland doom-emacs;
in {

  # Shells and Prompts
  starship = import ./homeModules/programs/starship;
  fish = import ./homeModules/programs/fish;

  # Terminals
  # uxterm
  alacritty = import ./homeModules/programs/alacritty;
  foot = import ./homeModules/programs/foot;
  # tmux

  # Browsers
  qutebrowser = import ./homeModules/programs/qutebrowser;
  #  firefox
  #  google-chrome Why would I ?

  # Status Bars
  xmobar = import ./homeModules/programs/xmobar;
  waybar = import ./homeModules/programs/waybar;
  polybar = import ./homeModules/programs/polybar;

  # Screen Lockers
  # swaylock = import ./homeModules/programs/swaylock;

  # Window Managers
  xmonad = import ./homeModules/programs/xmonad;
  awesome = import ./homeModules/programs/awesome;
  sway = import ./homeModules/programs/sway;
  hyprland = import ./homeModules/programs/hyprland;

  # Editors
  emacs = import ./homeModules/programs/emacs;
  neovim = import ./homeModules/programs/neovim;
  doom-emacs = import ./homeModules/programs/doom-emacs;

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
  picom = import ./homeModules/picom.nix;

  # Launcher
  rofi = import ./homeModules/programs/rofi;
  # wofi
  # nwgmenu

  # Misc
  email = import ./homeModules/email.nix;
  gui = import ./homeModules/gui.nix;
  packages = import ./homeModules/packages.nix;
  dconf = import ./homeModules/dconf.nix;
  keyboardLayouts = import ./homeModules/keyboard.nix;
  ledger = import ./homeModules/programs/ledger;

  systemProfile = {
    imports =
      [ nix-colors.homeManagerModule hyprland.homeManagerModules.default ];
    colorScheme = nix-colors.colorSchemes.nord;
    home.packages = [ nixpkgs.nix ];
    programs.home-manager.enable = true;
  };

  home = rec {
    homeDirectory = "/home/${username}";
    stateVersion = "23.05";
    username = "joseph";
    sessionVariables = { EDITOR = "nvim"; };
  };

}
