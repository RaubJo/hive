{ pkgs, ... }:

{
  services.xserver = {
    enable = true;
    layout = "us";
    libinput.enable = true;
    displayManager.sddm.enable = true;
    desktopManager.plasma5.enable = true;
    desktopManager.plasma5.excludePackages = with pkgs.libsForQt5; [
      elisa
      gwenview
      khelpcenter
    ];
  };
}
