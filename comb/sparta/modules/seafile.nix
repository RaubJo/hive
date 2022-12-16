{ config, pkgs, lib, ... }:
{
  services.seafile = {
    enable = true;
    seafilePackage = pkgs.seafile-server;
    adminEmail = "josephraub98@gmail.com";
    workers = 4;
    seahubExtraConf = "";
    initialAdminPassword = "changeme";
    ccnetSettings.General.SERVICE_URL = "localhost";
    seafileSettings = {
      fileserver = {
        host = "127.0.0.1";
        port = 8082;
      };
    };
  };
}
