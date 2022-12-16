{ config, ... }:

{
  networking.firewall = {
    enable = true;
    checkReversePath = "loose";
    allowedTCPPorts = [ 22 80 ];
    allowedUDPPorts = [ 53 80 ];
  };
}
