{ config, pkgs, lib, ... }: {
  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud25;
    hostName = "localhost";
    config = {
      adminpassFile = "${pkgs.writeText "adminpass" "123456"}";
      extraTrustedDomains = [
        "192.168.1.128"
        "100.74.102.53"
        "192.168.1.132"
        "100.105.66.4"
        "100.123.64.79"
        "100.94.127.111"
      ];
    };
    appstoreEnable = true;
    enableImagemagick = true;
  };
  #services.nginx.virtualHosts."localhost".listen = [ { addr = "127.0.0.1"; port = 8082; } ];
  services.nginx.enable = true;
  services.nginx.virtualHosts."nextcloud" = {
    addSSL = true;
    enableACME = true;
    root = "/var/lib/nextcloud";
  };
  security.acme.acceptTerms = true;
  security.acme.defaults.email = "josephraub98@gmail.com";
}
