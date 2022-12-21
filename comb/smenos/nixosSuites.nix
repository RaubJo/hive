let inherit (cell) nixosProfiles;
in rec {
  base = {
    imports = with nixosProfiles; [ tailscale locale nix firewall ssh ];
  };

  laptop = {
    imports = with nixosProfiles; [ wpa-networks users printing fonts ];
  };
  nvidia = { imports = with nixosProfiles; [ nvidia ]; };
  ephemeral = { imports = with nixosProfiles; [ zfs zram minify ]; };
  server = { imports = with nixosProfiles; [ nextcloud ]; };
  xmonad = { imports = [ nixosProfiles.xmonad ]; };
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
