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
        "$6$BO.9zW.3miRB4vNH$ixlr4ue0MYnaQbtKRzncjOHg25DFbm3MvjfD4GIC4.12HDCRlzh2B/X6zPtoa4ExjOoCQu8oxtCnSv3vjdBid.";
      extraGroups = [ "wheel" ];
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
