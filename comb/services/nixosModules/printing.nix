{ pkgs, ... }: {
  services.printing = {
    enable = true;
    drivers = [ pkgs.gutenprint ];
    browsing = true;
    listenAddresses = [ "localhost:631" ];
    allowFrom = [ "all" ];
  };
  services.avahi = {
    enable = true;
    publish.enable = true;
    publish.userServices = true;
  };
}
