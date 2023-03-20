{ ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        dimensions = {
          columns = 140;
          lines = 38;
        };
        opacity = 0.9;
        padding = {
          x = 5;
          y = 5;
        };
        decorations = "full";
        dynamic_title = false;
      };
      scrolling = {
        history = 10000;
        multiplier = 3;
      };

      font = {
        normal = {
          family = "SauceCodePro Nerd Font";
          style = "Regular";
        };
        bold = {
          family = "SauceCodePro Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "SauceCodePro Nerd Font";
          style = "Italic";
        };
        size = 9;
        offset = {
          x = 0;
          y = 0;
        };
        glyph_offset = {
          x = 0;
          y = 0;
        };
        debug.persistent_logging = false;
      };
      draw_bold_text_with_bright_colors = true;
      save_to_clipboard = true;
    };
  };
}
