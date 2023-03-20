{ config, ... }:

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
      fonts = {
        default_family = "SauceCodePro Nerd Font";
        default_size = "10pt";
      };
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
      downloads = { remove_finished = 10 * 1000; };
      tabs = {
        favicons.show = "never";
        last_close = "close";
        show = "multiple";
      };
      webpage = {
        darkmode.enabled = false;
        preferred_color_scheme = "dark";
      };
    };
  };
}
