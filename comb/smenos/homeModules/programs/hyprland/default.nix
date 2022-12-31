{ config, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
    disableAutoreload = false;
    nvidiaPatches = true;
    recommendedEnvironment = true;
    extraConfig = null;
  };
}
