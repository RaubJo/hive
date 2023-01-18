{ config, pkgs, ... }:

{
  services.picom = {
    enable = true;
    package = pkgs.picom-dccsillag;
    extraArgs = [
      "--xrender-sync-fence"
      "--animations"
      "--animations-for-open-window zoom"
    ];

    activeOpacity = 1;
    inactiveOpacity = 1;
    menuOpacity = 1;

    fade = true;
    fadeDelta = 10;

    shadow = true;
    shadowOpacity = 1;

    vSync = true;

  };
}
