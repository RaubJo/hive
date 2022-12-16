{ config, pkgs, lib, ... }:
{
  services.xserver.libinput = {
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
      naturalScrolling = false;
      horizontalScrolling = true;
      disableWhileTyping = true;
    };
  };
}
