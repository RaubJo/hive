let inherit (cell) nixosProfiles;
in {
  base = {
    imports = with nixosProfiles; [
      tailscale
      locale
      nix
      firewall
      ssh
      gpg
      packages
    ];
  };
  laptop = {
    imports = with nixosProfiles; [ wpa-networks users printing fonts ];
  };
  thinkpad = {
    imports = with nixosProfiles; [
      laptop-resolutions
      autorandr
      thinkpad-dock
      mysql
      docker
    ];
  };
  nvidia = { imports = with nixosProfiles; [ nvidia ]; };
  ephemeral = { imports = with nixosProfiles; [ zram minify ]; };
  nc-server = { imports = with nixosProfiles; [ nextcloud kurios ]; };
  gitlab-server = { imports = with nixosProfiles; [ gitlab kurios ]; };
  gitea-server = {
    imports = with nixosProfiles; [ gitea cloudflare-tunnel kurios ];
  };
  xmonad = { imports = with nixosProfiles; [ xmonad ]; };
  awesome = { imports = with nixosProfiles; [ awesome ]; };
  hyprland = { imports = with nixosProfiles; [ hyprland ]; };
  sway = { imports = with nixosProfiles; [ sway ]; };
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
