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
        height = 20;
        output = [ "eDP-1" ];
        modules-left = [ "wlr/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "battery" ];

        "wlr/workspaces" = {
          sort-by-name = true;
          on-click = "activate";
        };

        clock = {
          format = "{:%d/%m %H:%M}";
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
              opactiy: 0.2;
            }
            #waybar > .horizontal {
              padding: 10px 10px 0;
      	}
            #waybar > .horizontal > .horizontal:nth-child(1) {
              margin-right: 10px;
      	}
            #workspaces button {
              margin: 10px 0 0 10px;
      	font-size: 16px;
              padding: 7px 10px;
      	border-radius: 5px;
            }
            #workspaces button.active {
              background: #FFFFFF;
            }
            #workspaces button:hover {
              box-shadow: inherit;
      	text-shadow: inherit;
            }
            #mode {
              margin: 10px 0 0 10px;
      	padding: 0 10px;
      	border-radius: 5px;
      	}
            #window {
              font-weight: 600,
      	margin: 10px 0 0 10px;
      	}

            #workspaces button.active {

            }
    '';
    systemd.enable = false;
    systemd.target = "graphical-session.target";
  };
}
