{ config, pkgs, ... }:
{
  services = {
    printing = {
    enable = true;
    drivers = with pkgs; [ gutenprint ];
    browsing = true;
    listenAddresses = [ "localhost:631" ];
    allowFrom = [ "all" ];
    };
    avahi = {
      enable = true;
      publish.enable = true;
      publish.userServices = true;
    };
  };
}
