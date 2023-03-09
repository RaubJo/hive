{ config, ... }:

{

  services = {
    dunst = {
      enable = true;
      settings = {
        global = {
          monitor = 0;
          follow = "none";
          width = 300;
          height = 300;
          origin = "top-right";
          offset = "10x50";
          scale = 0;
          notification_limit = 5;
          progress_bar = true;
          progress_bar_height = 10;
          progress_bar_frame_width = 1;
          progress_bar_min_width = 150;
          progress_bar_max_width = 300;
          indicate_hidden = "yes";
          transparency = 5;
          separator_height = 2;
          padding = 8;
          horizontal_padding = 8;
          text_icon_padding = 0;
          frame_width = 1;
          frame_color = "#aaaaaa";
          separator_color = "frame";
          sort = "yes";
          font = "Monospace 8";
          line_height = 0;
          markup = "full";
          format = ''
            <b>%s</b>
            %b'';
          alignment = "left";
          vertical_alignment = "center";
          show_age_threshold = 60;
          ellipsize = "middle";
          ignore_newline = "no";
          stack_duplicates = true;
          hide_duplicate_count = false;
          show_indicators = "yes";
          icon_position = "left";
          min_icon_size = 0;
          max_icon_size = 16;
          sticky_history = "yes";
          history_length = 20;
          mouse_left_click = "close_current";
          mouse_right_click = "close_all";
        };
        urgency_low = {
          background = "#${config.colorScheme.colors.base07}";
          foreground = "#${config.colorScheme.colors.base05}";
          timeout = 10;
        };
        urgency_normal = {
          background = "#${config.colorScheme.colors.base0F}";
          foreground = "#${config.colorScheme.colors.base05}";
          timeout = 10;
        };
        urgency_critical = {
          background = "#${config.colorScheme.colors.base08}";
          foreground = "#${config.colorScheme.colors.base05}";
          frame_color = "#${config.colorScheme.colors.base0A}";
          timeout = 0;
        };
      };
    };
  };

}
