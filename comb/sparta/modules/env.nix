{ config, ... }:

{
  environment.etc = {
    "resolv.conf" = {
      text = ''
        nameserver 192.168.1.5
        nameserver 100.95.211.76
        nameserver 1.1.1.1
        nameserver 8.8.8.8'';
      mode = "644"; # Prevent tailscaled from overwriting resolv.conf
    };
    #    "r.txt" = {
    #      if config.networking.hostName "lenovo-p50" then "wlp4s0" else "wlan0";
    #  };
  };
}
