let inherit (cell) nixosProfiles;
in {
  base = {
    imports = with nixosProfiles; [ tailscale locale nix firewall ssh ];
  };
  laptop = {
    imports = with nixosProfiles; [ wpa-networks users printing fonts ];
  };
  nvidia = { imports = with nixosProfiles; [ nvidia ]; };
  ephemeral = { imports = with nixosProfiles; [ zfs zram minify ]; };
  nc-server = {
    imports = with nixosProfiles; [ nextcloud ];
    users.mutableUsers = false;
    users.users.kurios = {
      isNormalUser = true;
      hashedPassword =
        "$6$Do5TvmOu.qzB.yAu$4cwwNcMjRKgLgQ4qLzkRHVFkIXaVjJTWVXJGsh.B7YWsW4WCpRCwtgvg60x/2EO1nZyl9bChWnZxtZ1LR9NbW/";
      extraGroups = [ "wheel" ];
      password = "pass";
    };
  };
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
