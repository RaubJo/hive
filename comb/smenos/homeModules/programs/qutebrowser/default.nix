{ config, lib, pkgs, ... }:

{
  programs.qutebrowser = {
    enable = true;
    quickmarks = {
      "nixos/options" = "https://search.nixos.org/options";
      "nixos/packages" = "https://search.nixos.org/packages";
      "nixos/home-manager" = "https://github.com/nix-community/home-manager";
      "nhbc/visitor-log" =
        "https://docs.google.com/spreadsheets/d/1k0FtDhAFS96H3-DxOcGmEb2SL4cnCyXqGiMavs_zh2w/edit#gid=605338474";
      "biblingo" = "https://app.biblingo.org/login";
      "nhbc/website" = "https://nhbcwylie.org/";
      "nhbc/giving" = "https://giving.nhbcwylie.org/";
      "ebx/kcr" = "https://read.amazon.com/kindle-library";
      "emacs/doom" = "https://github.com/doomemacs/doomemacs";
      "messages" = "https://messages.google.com/web/conversations";
      "canva" = "https://www.canva.com/";
      "amazon" = "https://www.amazon.com/";
    };
    searchEngines = {
      ddg = "https://duckduckgo.com/?q={}";
      G = "https://www.google.com/search?hl=en&q={}";
      az = "https://www.amazon.com/s?k={}";
      yt = "https://www.youtube.com/results?search_query={}";
      gh = "https://github.com/search?q={}";
      no =
        "https://search.nixos.org/options?channel=unstable&from=0&size=50&sort=relevance&type=packages&query={}";
      np =
        "https://search.nixos.org/packages?channel=unstable&from=0&size=50&sort=relevance&type=packages&query={}";
      ho = "https://mipmip.github.io/home-manager-option-search/?{}";
    };
    settings = {
      content = {
        autoplay = false;
        pdfjs = false;
        cookies = {
          accept = "no-3rdparty";
          store = true;
        };
        geolocation = false;
        hyperlink_auditing = true;
        images = true;
        media = {
          audio_capture = false;
          audio_video_capture = false;
          video_capture = false;
        };
        notifications = { enabled = false; };
        prefers_reduced_motion = true;
      };
      completion.height = "25%";
      downloads = { remove_finished = 60 * 1000; };
      tabs = {
        favicons.show = "never";
        last_close = "close";
        show = "multiple";
      };
      colors = {
        completion = {
          fg = "#${config.colorScheme.colors.base04}";
          even.bg = "#${config.colorScheme.colors.base01}";
          odd.bg = "#${config.colorScheme.colors.base02}";
          category = {
            fg = "#${config.colorScheme.colors.base04}";
            bg =
              "qlineargradient(x1:0, y1:0, x2:0, y2:1, stop:0 #${config.colorScheme.colors.base03}, stop:1 #${config.colorScheme.colors.base00})";
            border = {
              top = "#${config.colorScheme.colors.base03}";
              bottom = "#${config.colorScheme.colors.base00}";
            };
          };
          item = {
            selected = {
              fg = "#${config.colorScheme.colors.base01}";
              bg = "#${config.colorScheme.colors.base0A}";
              border = {
                top = "#${config.colorScheme.colors.base0A}";
                bottom = "#${config.colorScheme.colors.base0A}";
              };
              match = { fg = "#${config.colorScheme.colors.base08}"; };
            };
          };
        };
        prompts = {
          bg = "#${config.colorScheme.colors.base01}";
          fg = "#${config.colorScheme.colors.base04}";
          border = "1px solid #${config.colorScheme.colors.base00}";
        };
        messages = {
          error = {
            fg = "#${config.colorScheme.colors.base05}";
            bg = "#${config.colorScheme.colors.base08}";
            border = "#${config.colorScheme.colors.base08}";
          };
          info = {
            fg = "#${config.colorScheme.colors.base01}";
            bg = "#${config.colorScheme.colors.base0B}";
            border = "#${config.colorScheme.colors.base0B}";
          };
          warning = {
            fg = "#${config.colorScheme.colors.base01}";
            bg = "#${config.colorScheme.colors.base0A}";
            border = "#${config.colorScheme.colors.base0A}";
          };
        };
        downloads = {
          start = {
            fg = "#${config.colorScheme.colors.base01}";
            bg = "#${config.colorScheme.colors.base09}";
          };
          stop = {
            fg = "#${config.colorScheme.colors.base01}";
            bg = "#${config.colorScheme.colors.base0B}";
          };
          error = {
            fg = "#${config.colorScheme.colors.base06}";
            bg = "#${config.colorScheme.colors.base08}";
          };
          system = {
            bg = "rgb";
            fg = "rgb";
          };
        };
        hints = {
          #bg = "#${config.colorScheme.colors.base0A}BF";
          bg = "rgba(235,203,139,0.8)";
          fg = "#${config.colorScheme.colors.base01}";
          match.fg = "#${config.colorScheme.colors.base0B}";
        };
        keyhint = {
          fg = "#${config.colorScheme.colors.base04}";
          bg = "#${config.colorScheme.colors.base01}";
          suffix.fg = "#${config.colorScheme.colors.base0A}";
        };
        statusbar = {
          normal = {
            bg = "#${config.colorScheme.colors.base00}";
            fg = "#${config.colorScheme.colors.base04}";
          };
          insert = {
            bg = "#${config.colorScheme.colors.base0B}";
            fg = "#${config.colorScheme.colors.base01}";
          };
          passthrough = {
            bg = "#${config.colorScheme.colors.base0C}";
            fg = "#${config.colorScheme.colors.base01}";
          };
          caret = {
            bg = "#${config.colorScheme.colors.base0E}";
            fg = "#${config.colorScheme.colors.base01}";
          };
          command = {
            bg = "#${config.colorScheme.colors.base00}";
            fg = "#${config.colorScheme.colors.base04}";

          };
          progress.bg = "#${config.colorScheme.colors.base07}";
          url = {
            success.http.fg = "#${config.colorScheme.colors.base0B}";
            success.https.fg = "#${config.colorScheme.colors.base0B}";
            hover.fg = "#${config.colorScheme.colors.base0C}";
            error.fg = "#${config.colorScheme.colors.base08}";
            warn.fg = "#${config.colorScheme.colors.base0A}";
          };
        };
        tabs = {
          bar.bg = "#${config.colorScheme.colors.base01}";
          even.bg = "#${config.colorScheme.colors.base03}";
          even.fg = "#${config.colorScheme.colors.base04}";
          odd.fg = "#${config.colorScheme.colors.base04}";
          odd.bg = "#${config.colorScheme.colors.base02}";
          indicator = {
            error = "#${config.colorScheme.colors.base08}";
            stop = "#${config.colorScheme.colors.base0B}";
            start = "#${config.colorScheme.colors.base0D}";
          };
        };
        webpage = {
          darkmode.enabled = false;
          preferred_color_scheme = "dark";
        };
      };
    };
  };
}
