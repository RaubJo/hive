{
  gtk = {
    enable = true;
    theme = {
      name = "Nordic";
      package = pkgs.nordic;
    };
    iconTheme = {
      name = "Nordzy-dark";
      package = pkgs.nordzy-icon-theme;
    };
    cursorTheme = {
      name = "Nordzy-cursors";
      package = pkgs.nordzy-cursor-theme;
    };
    gtk3.bookmarks = [
      "file:///home/joseph/Documents"
      "file:///home/joseph/Downloads"
      "file:///home/joseph/Music"
      "file:///home/joseph/Pictures"
      "file:///home/joseph/Videos"
      "file:///home/joseph/Documents/NHBC"
      "file:///home/joseph/org/sermons"
    ];
  };
  qt = {
    enable = true;
    platformTheme = "gtk";
    style = {
      package = pkgs.libsForQt5.qtstyleplugins;
      name = "gtk2";
    };
  };
}
