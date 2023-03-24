{ ... }: {
  services = {
    touchegg.enable = true;
    unclutter.enable = true;
    unclutter.timeout = 1;
    xserver.libinput = {
      enable = true;
      mouse = {
        tapping = true;
        tappingDragLock = false;
        naturalScrolling = true;
        horizontalScrolling = false;
      };
      touchpad = {
        tapping = true;
        tappingDragLock = true;
        naturalScrolling = true;
        horizontalScrolling = true;
        disableWhileTyping = true;
      };
    };
  };
}
