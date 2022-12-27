let inherit (cell) nixosProfiles;
in {
  base = {
    imports = with nixosProfiles; [
      tailscale
      locale
      nix
      firewall
      ssh
      packages
    ];
  };
  laptop = {
    imports = with nixosProfiles; [ wpa-networks users printing fonts ];
  };
  nvidia = { imports = with nixosProfiles; [ nvidia ]; };
  ephemeral = { imports = with nixosProfiles; [ zfs zram minify ]; };
  nc-server = { imports = with nixosProfiles; [ nextcloud kurios ]; };
  xmonad = { imports = with nixosProfiles; [ xmonad ]; };
  kde = { imports = with nixosProfiles; [ kde ]; };
  guardian = { imports = with nixosProfiles; [ ]; };
  tablet = {
    imports = with nixosProfiles; [
      gnome
      touchscreen
      nm-networks
      fonts
      zram
      printing
      minify
      users
    ];
  };

}
