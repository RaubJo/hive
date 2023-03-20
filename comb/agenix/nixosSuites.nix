let
  inherit (cell) nixosModules;
in
{
  wpa-networks = with nixosModules; [ wifi ];
  dyndns = with nixosModules; [ dyndns ];
  gitea = with nixosModules; [ gitea-server ];
  cloudflared = with nixosModules; [ cloudflared ];
}
