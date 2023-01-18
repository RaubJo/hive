{ config, lib, pkgs, ... }:

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
        output = [ "eDP-1" ];
        modules-left = [ "sway/workspaces" "sway/mode" "sway/scratchpad" ];
        modules-center = [ "sway/window" "clock" ];
        modules-right =
          [ "tray" "backlight" "network" "cpu" "memory" "battery" ];

        "wlr/workspaces" = {
          sort-by-name = true;
          on-click = "activate";
        };

        "sway/workspaces" = {
          all-outputs = true;
          format = "{name}";
          format-icons = {
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "";
            "5" = "";
            "6" = "";
            "7" = "";
            "9" = "";
            "10" = "";
            focused = "";
            urgent = "";
            default = "";
          };
        };

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
      };
    };
    style = ''
      * {
        border: none;
        border-radius: 0;
        font-family: Source Code Pro;
        font-size: 13px;
      }
      window#waybar {
        background: #16191C;
        color: #AAB2BF;
      }
      window#waybar.hidden {
        opacity: 0.2;
      }
      #waybar > .horizontal {
        padding: 2px 2px 0;
      }
      #waybar > .horizontal > .horizontal:nth-child(1) {
        margin-right: 10px;
      }
      button {
        /* Use box-shadow instead of border so the text isn't offset */
        box-shadow: inset 0 -3px transparent;
        /* Avoid rounded borders under each button name */
        border: none;
        border-radius: 0;
      }
      #workspaces button.active {

        background: #FFFFFF;
      }
      #mode {
        margin: 10px 0 0 10px;
        padding: 0 10px;
        border-radius: 5px;
      }
      #window {
        font-weight: 600;
        margin: 10px 0 0 10px;
      }
    '';
    systemd.enable = false;
    systemd.target = "graphical-session.target";
  };
}
