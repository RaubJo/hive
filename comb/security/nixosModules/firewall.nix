{
  networking.firewall = {
    enable = true;
    checkReversePath = "loose";
    allowedTCPPorts = [ 22 80 443 3001 ];
    allowedUDPPorts = [ 22 80 443 3001 ];
  };
}
