{ config, lib, pkgs, ... }:

{
  wayland.windowManager.sway = {
    enable = true;
    config = rec {
      modifier = "Mod4";
      terminal = "alacritty";
      menu = "";
      startup = [ ];

      focus = {
        followMouse = true;
        wrapping = "yes";
        mouseWarping = true;
        newWindow = "smart";
      };

      gaps = {
        bottom = 5;
        top = 5;
        left = 5;
        right = 5;
        outer = 5;
        inner = 5;
        horizontal = 5;
        vertical = 5;
        smartBorders = "on";
        smartGaps = true;

      };

      keybindings =
        let mod = config.wayland.windowManager.sway.config.modifier;
        in
        {
          "${mod}+1" = "workspace number 1";
          "${mod}+2" = "workspace number 2";
          "${mod}+3" = "workspace number 3";
          "${mod}+4" = "workspace number 4";
          "${mod}+5" = "workspace number 5";
          "${mod}+6" = "workspace number 6";
          "${mod}+7" = "workspace number 7";
          "${mod}+8" = "workspace number 8";
          "${mod}+9" = "workspace number 9";

          "${mod}+Shift+1" = "move container to workspace number 1";
          "${mod}+Shift+2" = "move container to workspace number 2";
          "${mod}+Shift+3" = "move container to workspace number 3";
          "${mod}+Shift+4" = "move container to workspace number 4";
          "${mod}+Shift+5" = "move container to workspace number 5";
          "${mod}+Shift+6" = "move container to workspace number 6";
          "${mod}+Shift+7" = "move container to workspace number 7";
          "${mod}+Shift+8" = "move container to workspace number 8";
          "${mod}+Shift+9" = "move container to workspace number 9";

          "${mod}+Down" = "focus down";
          "${mod}+Up" = "focus up";
          "${mod}+Left" = "focus left";
          "${mod}+Right" = "focus right";

          "${mod}+Shift+Down" = "move down";
          "${mod}+Shift+Up" = "move up";
          "${mod}+Shift+Left" = "move left";
          "${mod}+Shift+Right" = "move right";

          "${mod}+q" =
            "swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -b 'Yes, exit sway' 'swaymsg exit'";

          "${mod}+Shift+r" = "reload";
          "${mod}+Shift+c" = "kill";
          #"${mod}+Space" = "layout toggle split";
          "${mod}+f" = "fullscreen toggle";
          "${mod}+r" = "exec ${config.wayland.windowManager.sway.config.menu}";
          "${mod}+b" = "exec qutebrowser";
          "${mod}+e" = "exec emacs";
          "${mod}+Return" =
            "exec ${config.wayland.windowManager.sway.config.terminal}";
        };

      bars = [{ command = "waybar"; }];

    };
    #extraPackages = with pkgs; [ xwayland gsettings_desktop_schemas ];
    #  config = {
    #    assigns = { };
    #    bars = [ ];

    #  };
  };
}
