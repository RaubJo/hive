{ pkgs, inputs, ... }:
{
  programs.waybar = {
    enable = true;
    package = pkgs.waybar.overrideAttrs (oa: {
      mesonFlags = (oa.mesonFlags or [ ]) ++ [ "-Dexperimental=true" ];
    });
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        #height = 20;
        spacing = "5";
        output = [ "eDP-1" ];
        modules-left = [ "sway/workspaces" "sway/mode" "sway/scratchpad" ];
        modules-center = [ "clock" ];
        modules-right =
          [ "tray" "backlight" "network" "cpu" "memory" "battery" ];

        "wlr/workspaces" = {
          sort-by-name = true;
          on-click = "activate";
        };

        "sway/workspaces" = {
          all-outputs = true;
          format = "{icon}";
          format-icons = {
            "1" = "<span size='xxx-large'></span>";
            "2" = "<span size='xx-large'></span>";
            "3" = "<span size='xx-large'>󰖟</span>";
            "4" = "<span size='xx-large'>󰎆</span>";
            "5" = "<span size='xx-large'></span>";
            "6" = "<span size='xx-large'></span>";
            "7" = "<span size='xx-large'></span>";
            "9" = "<span size='xx-large'></span>";
            "10" = "<span size='xx-large'></span>";
            focused = "<span size='xx-large'></span>";
            urgent = "<span size='xx-large'>󰵲</span>";
            default = "<span size='xx-large'></span>";
          };
        };

        "sway/window" = { spaceing = 10; };

        tray = { spacing = 10; };
        cpu = { format = "{usage}% "; };
        memory = { format = "{}% "; };
        network = {
          format-wifi = "{essid} ({signalStrength}%) ";
          format-ethernet = "Ethernet ";
          format-linked = "Ethernet (No IP) ";
          format-disconnected = "Disconnected ";
          format-alt = "{bandwidthDownBits}/{bandwidthUpBits}";
          on-click-middle = "nm-connection-editor";
        };

        clock = {
          format = "{:%m/%d %H:%M}";
          tooltip = false;
        };
        backlight = {
          # device = "acpi_video1":
          format = "{percent}%";
        };
      };
    };
    style = builtins.readFile ./style.css;
    systemd.enable = false;
    systemd.target = "graphical-session.target";
  };
}
