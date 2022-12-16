{ config, pkgs, lib, ... }:
{
  services.hydra = {
    enable = true;
    hydraURL = "https://localhost:80";
    notificationSender = "hydra@localhost";
    buildMachinesFiles = [];
    useSubstitutes = true;
  };
}
