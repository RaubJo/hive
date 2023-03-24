{ pkgs, ... }: {
  services.ddclient = {
    enable = true;
    ssl = true;
    protocol = "googledomains";
    username = "DdtxLAeSTB0nXnmQ";
    passwordFile = "${pkgs.writeText "password" "dEt4EwV06sJLZ9rO"}";
    ipv6 = false;
    use = "web, web=checkip.dyndns.com/, web-skip='Current IP Address: '";
    interval = "10min";
    domains = [ "bitwright.dev" ];
  };
}
