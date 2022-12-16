{ config, lib, pkgs, ... }:

{
  services.minidlna = {
    enable = true;
    settings = {
      port = 6000;
      inotify = "no";
      notify_interval = 90000;
      wide_links = "no";
      root_container = ".";
      media_dir = [ "/home/joseph/library" ];
      log_level = "warn";
      friendly_name = "optiplex";
      enable_tivo = "no";
      db_dir = "/var/cache/minidlna";
    };
    openFirewall = true;
  };
}
