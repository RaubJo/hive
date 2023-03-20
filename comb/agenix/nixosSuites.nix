let
  inherit (cell) nixosModules;
in
{
  wpa-networks = with nixosModules; [ wifi ];
  ddclient = with nixosModules; [ dyndns ];
  gitea = with nixosModules; [ gitea-server ];
  cloudflare-tunnel = with nixosModules; [ cloudflared ];
}
