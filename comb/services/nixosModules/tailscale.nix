{ ... }: {
  services.tailscale.enable = true;
  environment.etc = {
    "resolv.conf" = {
      text = ''
        nameserver 100.95.211.76
        nameserver 1.1.1.1
        nameserver 8.8.8.8
      '';
      mode = "644"; # This prevents tailscaled from rewriting resolv.conf
    };
  };
}
