{ config, lib, pkgs, ... }:
{
  services.xserver = {
    enable = true;
    layout = "us";
    libinput.enable = true;
    displayManager = {
      lightdm.enable = true;
      lightdm.greeters.slick.enable = true;
      lightdm.background = ../images/backgrounds/snow_mountains.jpg;
    };
  };

}
