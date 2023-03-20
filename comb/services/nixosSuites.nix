{ inputs, cell }:
let
  inherit (cell) nixosModules;
in
rec {
  default = with nixosModules; [
    tailscale
  ];

  lenovo-p50 = with nixosModules; [
    autorandr
    printing
  ];

  web-dev = with nixosModules; [
    mysql
  ];

  gitea-server = with nixosModules; [
    gitea
    #cloudflared - Zero Trust Tunneling!
    #ddclient - use this if you can only have dyndns
  ];

  nextcloud = with nixosModules; [
    nextcloud
  ];

  tablet = with nixosModules; [
    touchscreen
    printing
  ];

}
