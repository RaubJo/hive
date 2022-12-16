{ config, lib, pkgs, ... }:

{
  services.gitea = {
    enable = true;
    httpAddress = "0.0.0.0";
    httpPort = 8001;
  };
}
