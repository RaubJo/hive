{ pkgs, ... }:

{
  services.picom = {
    enable = true;
    package = pkgs.picom.overrideAttrs (_o: {
      src = pkgs.fetchFromGitHub {
        repo = "picom";
        owner = "pijulius";
        rev = "982bb43e5d4116f1a37a0bde01c9bda0b88705b9";
        sha256 = "YiuLScDV9UfgI1MiYRtjgRkJ0VuA1TExATA2nJSJMhM=";
      };
    });
    activeOpacity = 1;
    settings = {
      "animation-clamping" = true;
      "animation-dampening" = 25.0;
      "animation-for-menu-window" = "slide-down";
      "animation-for-open-window" = "zoom";
      "animation-for-transient-window" = "slide-down";
      "animation-for-unmap-window" = "zoom";
      "animation-for-workspace-switch-in" = "slide-down";
      "animation-for-workspace-switch-out" = "slide-up";
      "animation-mass" = 0.7;
      "animation-stiffness" = 175.0;
      "animations" = true;
      "corner-radius" = 10;
      "inactive-dim" = 5.0e-2;
    };

    extraArgs = [ "--xrender-sync-fence" ];

    backend = "xrender";
    inactiveOpacity = 1;
    menuOpacity = 0.9;

    fade = true;
    fadeDelta = 7;

    shadow = true;
    shadowOpacity = 0.8;

    vSync = true;

  };
}
