let inherit (cell) nixosProfiles;
in {
  base = {
    imports = with nixosProfiles; [
      tailscale
      locale
      nix
      firewall
      fonts
      ssh
      env
      printing
      wpa-networks
    ];
  };
}
