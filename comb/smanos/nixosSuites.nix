let inherit (cell) nixosProfiles;
in {
  base = {
    imports = with nixosProfiles; [ tailscale locale nix firewall ssh ];
  };

  laptop = {
    imports = with nixosProfiles; [
      wpa-networks
      kde
      nvidia
      users
      printing
      fonts
      minify
    ];
  };
  server = { imports = with nixosProfiles; [ nextcloud ]; };
  mobile = {
    imports = with nixosProfiles; [
      gnome
      touchscreen
      nm-networks
      fonts
      zram
      printing
      minify
    ];
  };

}
