{ config, lib, pkgs, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    ## /ORG/ ##
    "gnome/Console" = { font-scale = 0.7000000000000001; };

    "gnome/Geary" = {
      migrated-config = true;
      window-maximize = true;
    };

    "gnome/cheese" = { burst-delay = 1000; };

    "gnome/clocks" = {
      world-clocks =
        "[{'location': <(uint32 2, <('Bangkok', 'VTBD', true, [(0.24289166005364171, 1.7558012275062955)], [(0.23998277214922031, 1.754346792280731)])>)>}]";
    };

    "gnome/clocks/state/window" = {
      maximized = true;
      panel-id = "world";
      size = mkTuple [ 870 690 ];
    };

    "gnome/control-center" = {
      last-panel = "info-overview";
      window-state = mkTuple [ 980 640 ];
    };

    "gnome/desktop/a11y" = { always-show-universal-access-status = false; };

    "gnome/desktop/a11y/applications" = { screen-keyboard-enabled = false; };

    "gnome/desktop/app-folders" = { folder-children = [ "Utilities" "YaST" ]; };

    "gnome/desktop/app-folders/folders/Utilities" = {
      apps = [
        "gnome-abrt.desktop"
        "gnome-system-log.desktop"
        "nm-connection-editor.desktop"
        "org.gnome.baobab.desktop"
        "org.gnome.Connections.desktop"
        "org.gnome.DejaDup.desktop"
        "org.gnome.Dictionary.desktop"
        "org.gnome.DiskUtility.desktop"
        "org.gnome.eog.desktop"
        "org.gnome.Evince.desktop"
        "org.gnome.FileRoller.desktop"
        "org.gnome.fonts.desktop"
        "org.gnome.seahorse.Application.desktop"
        "org.gnome.tweaks.desktop"
        "org.gnome.Usage.desktop"
        "vinagre.desktop"
      ];
      categories = [ "X-GNOME-Utilities" ];
      name = "X-GNOME-Utilities.directory";
      translate = true;
    };

    "gnome/desktop/app-folders/folders/YaST" = {
      categories = [ "X-SuSE-YaST" ];
      name = "suse-yast.directory";
      translate = true;
    };

    "gnome/desktop/background" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      picture-uri =
        "file:///nix/store/35ar90nmzs3n8zqs1sfqlx6z8mk77qqm-simple-blue-2016-02-19/share/backgrounds/nixos/nix-wallpaper-simple-blue.png";
      picture-uri-dark =
        "file:///nix/store/sn0a9jq9ykq55805v6sdkjm4gsaki9q9-simple-dark-gray-2016-02-19/share/backgrounds/nixos/nix-wallpaper-simple-dark-gray.png";
      primary-color = "#3a4ba0";
      secondary-color = "#2f302f";
    };

    "gnome/desktop/input-sources" = {
      sources = [ (mkTuple [ "xkb" "us" ]) ];
      xkb-options = [ "terminate:ctrl_alt_bksp" ];
    };

    "gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      enable-hot-corners = false;
      show-battery-percentage = true;
      toolkit-accessibility = false;
    };

    "gnome/desktop/media-handling" = {
      autorun-never = true;
      autorun-x-content-ignore = [
        "x-content/unix-software"
        "x-content/image-dcf"
        "x-content/audio-player"
        "x-content/video-dvd"
        "x-content/audio-cdda"
      ];
      autorun-x-content-open-folder = [ ];
      autorun-x-content-start-app = [ "x-content/ostree-repository" ];
    };

    "gnome/desktop/notifications" = {
      application-children = [
        "gnome-power-panel"
        "org-gnome-console"
        "org-gnome-settings"
        "xdg-desktop-portal-gnome"
        "gnome-network-panel"
      ];
    };

    "gnome/desktop/notifications/application/gnome-network-panel" = {
      application-id = "gnome-network-panel.desktop";
    };

    "gnome/desktop/notifications/application/gnome-power-panel" = {
      application-id = "gnome-power-panel.desktop";
    };

    "gnome/desktop/notifications/application/org-gnome-console" = {
      application-id = "org.gnome.Console.desktop";
    };

    "gnome/desktop/notifications/application/org-gnome-settings" = {
      application-id = "org.gnome.Settings.desktop";
    };

    "gnome/desktop/notifications/application/xdg-desktop-portal-gnome" = {
      application-id = "xdg-desktop-portal-gnome.desktop";
    };

    "gnome/desktop/peripherals/tablets/04f3:2a1c" = {
      area = [ 0.0 0.0 0.0 0.0 ];
    };

    "gnome/desktop/peripherals/touchpad" = {
      two-finger-scrolling-enabled = true;
    };

    "gnome/desktop/screensaver" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      picture-uri =
        "file:///nix/store/35ar90nmzs3n8zqs1sfqlx6z8mk77qqm-simple-blue-2016-02-19/share/backgrounds/nixos/nix-wallpaper-simple-blue.png";
      primary-color = "#3a4ba0";
      secondary-color = "#2f302f";
    };

    "gnome/desktop/session" = { idle-delay = mkUint32 0; };

    "gnome/desktop/sound" = {
      event-sounds = true;
      theme-name = "__custom";
    };

    "gnome/epiphany" = {
      default-search-engine = "DuckDuckGo";
      restore-session-policy = "crashed";
      search-engine-providers =
        "[{'url': <'https://www.bing.com/search?q=%s'>, 'bang': <'!b'>, 'name': <'Bing'>}, {'url': <'https://duckduckgo.com/?q=%s&t=epiphany'>, 'bang': <'!ddg'>, 'name': <'DuckDuckGo'>}, {'url': <'https://www.google.com/search?q=%s'>, 'bang': <'!g'>, 'name': <'Google'>}]";
    };

    "gnome/epiphany/state" = {
      is-maximized = true;
      window-position = mkTuple [ 0 0 ];
      window-size = mkTuple [ 0 0 ];
    };

    "gnome/epiphany/web" = {
      default-zoom-level = 0.75;
      enable-adblock = false;
      enable-mouse-gestures = false;
    };

    "gnome/evince" = {
      document-directory = "@ms 'file:///home/joseph/Downloads'";
    };

    "gnome/evince/default" = {
      window-ratio = mkTuple [ 1.0457516339869282 0.7676767676767676 ];
    };

    "gnome/evolution-data-server" = {
      migrated = true;
      network-monitor-gio-name = "";
    };

    "gnome/gnome-system-monitor" = {
      maximized = false;
      network-total-in-bits = false;
      show-dependencies = false;
      show-whose-processes = "user";
      window-state = mkTuple [ 700 500 ];
    };

    "gnome/gnome-system-monitor/disktreenew" = {
      col-6-visible = true;
      col-6-width = 0;
    };

    "gnome/maps" = {
      map-type = "MapsStreetSource";
      transportation-type = "pedestrian";
      window-maximized = true;
      zoom-level = 16;
    };

    "gnome/mutter" = {
      attach-modal-dialogs = true;
      dynamic-workspaces = true;
      edge-tiling = true;
      focus-change-on-pointer-rest = true;
      workspaces-only-on-primary = true;
    };

    "gnome/nautilus/preferences" = {
      click-policy = "single";
      default-folder-viewer = "icon-view";
      migrated-gtk-settings = true;
      search-filter-time-type = "last_modified";
    };

    "gnome/nautilus/window-state" = {
      initial-size = mkTuple [ 890 550 ];
      maximized = true;
    };

    "gnome/portal/filechooser/org/kde/okular" = {
      last-folder-path = "/home/joseph/org/sermons/hall_of_faith";
    };

    "gnome/settings-daemon/peripherals/touchscreen" = {
      orientation-lock = false;
    };

    "gnome/settings-daemon/plugins/color" = { night-light-enabled = true; };

    "gnome/settings-daemon/plugins/power" = {
      ambient-enabled = false;
      power-button-action = "suspend";
      power-saver-profile-on-low-battery = false;
      sleep-inactive-ac-timeout = 4800;
      sleep-inactive-battery-timeout = 5400;
      sleep-inactive-battery-type = "suspend";
    };

    "gnome/shell" = {
      app-picker-layout =
        "[{'org.gnome.Geary.desktop': <{'position': <0>}>, 'org.gnome.Contacts.desktop': <{'position': <1>}>, 'org.gnome.Weather.desktop': <{'position': <2>}>, 'org.gnome.clocks.desktop': <{'position': <3>}>, 'org.gnome.Maps.desktop': <{'position': <4>}>, 'org.gnome.Extensions.desktop': <{'position': <5>}>, 'org.gnome.Photos.desktop': <{'position': <6>}>, 'org.gnome.Totem.desktop': <{'position': <7>}>, 'org.gnome.Calculator.desktop': <{'position': <8>}>, 'firefox.desktop': <{'position': <9>}>, 'simple-scan.desktop': <{'position': <10>}>, 'htop.desktop': <{'position': <11>}>, 'gnome-system-monitor.desktop': <{'position': <12>}>, 'cups.desktop': <{'position': <13>}>, 'nixos-manual.desktop': <{'position': <14>}>, 'Utilities': <{'position': <15>}>, 'org.gnome.TextEditor.desktop': <{'position': <16>}>, 'yelp.desktop': <{'position': <17>}>, 'org.gnome.Tour.desktop': <{'position': <18>}>, 'org.gnome.Cheese.desktop': <{'position': <19>}>, 'nvim.desktop': <{'position': <20>}>, 'xterm.desktop': <{'position': <21>}>, 'org.gnome.Calendar.desktop': <{'position': <22>}>, 'org.gnome.Music.desktop': <{'position': <23>}>}]";
      disabled-extensions = [
        "apps-menu@gnome-shell-extensions.gcampax.github.com"
        "window-list@gnome-shell-extensions.gcampax.github.com"
        "windowsNavigator@gnome-shell-extensions.gcampax.github.com"
        "user-theme@gnome-shell-extensions.gcampax.github.com"
      ];
      enabled-extensions = [
        "drive-menu@gnome-shell-extensions.gcampax.github.com"
        "places-menu@gnome-shell-extensions.gcampax.github.com"
        "native-window-placement@gnome-shell-extensions.gcampax.github.com"
      ];
      favorite-apps = [
        "org.gnome.Epiphany.desktop"
        "org.gnome.Settings.desktop"
        "org.kde.okular.desktop"
      ];
      had-bluetooth-devices-setup = true;
      last-selected-power-profile = "power-saver";
      welcome-dialog-last-shown-version = "42.4";
    };

    "gnome/shell/world-clocks" = {
      locations =
        "[<(uint32 2, <('Bangkok', 'VTBD', true, [(0.24289166005364171, 1.7558012275062955)], [(0.23998277214922031, 1.754346792280731)])>)>]";
    };

    "gnome/simple-scan" = { document-type = "photo"; };

    "gtk/gtk4/settings/file-chooser" = {
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = true;
      show-size-column = true;
      show-type-column = true;
      sidebar-width = 144;
      sort-column = "name";
      sort-directories-first = true;
      sort-order = "ascending";
      type-format = "category";
      window-size = mkTuple [ 640 374 ];
    };

    "gtk/settings/file-chooser" = {
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = false;
      show-size-column = true;
      show-type-column = true;
      sidebar-width = 157;
      sort-column = "name";
      sort-directories-first = false;
      sort-order = "ascending";
      type-format = "category";
      window-position = mkTuple [ 26 23 ];
      window-size = mkTuple [ 960 561 ];
    };

    ## /system/ ##
    "proxy" = { mode = "none"; };
    ## /ca/ ##
    "desrt/dconf-editor" = { show-warning = false; };
  };
}
