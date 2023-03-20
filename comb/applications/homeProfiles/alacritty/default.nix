{ config, ... }: {
  programs.alacritty = {
    settings = {
      colors = {
        primary = {
          background = "#${config.colorScheme.colors.base00}";
          foreground = "#${config.colorScheme.colors.base04}";
          dim_foreground = "#${config.colorScheme.colors.base02}";
        };
        normal = {
          black = "#${config.colorScheme.colors.base00}";
          red = "#${config.colorScheme.colors.base08}";
          green = "#${config.colorScheme.colors.base0B}";
          yellow = "#${config.colorScheme.colors.base0A}";
          blue = "#${config.colorScheme.colors.base0D}";
          magenta = "#${config.colorScheme.colors.base0E}";
          cyan = "#${config.colorScheme.colors.base0C}";
          white = "#${config.colorScheme.colors.base05}";
        };
        bright = {
          black = "#${config.colorScheme.colors.base00}";
          red = "#${config.colorScheme.colors.base08}";
          green = "#${config.colorScheme.colors.base0B}";
          yellow = "#${config.colorScheme.colors.base0A}";
          blue = "#${config.colorScheme.colors.base0D}";
          magenta = "#${config.colorScheme.colors.base0E}";
          cyan = "#${config.colorScheme.colors.base0C}";
          white = "#${config.colorScheme.colors.base05}";
        };
        dim = {
          black = "#${config.colorScheme.colors.base03}";
          red = "#${config.colorScheme.colors.base08}";
          green = "#${config.colorScheme.colors.base0B}";
          yellow = "#${config.colorScheme.colors.base0A}";
          blue = "#${config.colorScheme.colors.base0D}";
          magenta = "#${config.colorScheme.colors.base0E}";
          cyan = "#${config.colorScheme.colors.base0C}";
          white = "#${config.colorScheme.colors.base05}";
        };
        selection = {
          text = "CellForeground";
          background = "#${config.colorScheme.colors.base03}";
        };
        search = {
          matches = {
            foreground = "CellBackground";
            background = "#${config.colorScheme.colors.base0C}";
          };
          footer_bar = {
            foreground = "#${config.colorScheme.colors.base02}";
            background = "#${config.colorScheme.colors.base04}";
          };
        };
      };
      cursor = {
        text = "#${config.colorScheme.colors.base00}";
        cursor = "#${config.colorScheme.colors.base04}";
        style = "Block";
        unfocused_hollow = true;
      };
      vi_mode_cursor = {
        text = "#${config.colorScheme.colors.base00}";
        cursor = "#${config.colorScheme.colors.base04}";
      };

    };
  };
}
