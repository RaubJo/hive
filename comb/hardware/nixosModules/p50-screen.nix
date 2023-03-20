{
  services.xserver = {
    dpi = 96;
    resolutions = [{
      x = 1920;
      y = 1080;
    }];
    xrandrHeads = [{
      output = "eDP1-1";
      primary = true;
    }];
  };
}
