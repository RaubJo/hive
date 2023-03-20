let
  joseph-rsa =
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCuAkGqx5yNT2+ZO7SRGfNVxh+4qb3YhEBsntTAMpdLjrmJTAtgDqdigjXosuAlHVUVjTQeWLQbk1kfRxaI4VA9Nj9uROTY3lhlwNtvhLxYumwRrKZ2j95lY8nAtaDSNHfg8MPMkVHXGi+8imSZEGyKx4p4V65RrOvMTYFP144OFdoIln1AjWuUf2/c4oBS0MESz0gECzexy4//gZv38GDyug0N/7vUkfl5lceIRQjIAtRgxM7qdifoFJCRHCdc1PP7wXfNMpAcYNd0rWjXQNrbQrvTG/RJwoN4Y/G0ZVKtQbLfpXD3QovFl7CcymX9/roJGfKdkHu4VfHSdZ5WZbuJwVsBEDwMpELz9uoLYEeYNu/qHPdl11STsKl9F9K7rkkF68k2iJxv+MRsCQQojyzryQHoVFnV3FwGg69gemVKyMExKfpDR0zBfIbw4Ky7m3PeMzg9dTytMCx/fK4iuNvXjiu2tX6jjsVnWcpqLwCj3BiLkA2Lia1rdRYXzofxgp8= joseph@meletao";

  meletao =
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIG8kUvXjSeu6VPlLyqrvOxs1x/oovXBLwTryUW2IPSfD";
  kouphizo = "";
  kerugma = "";
  tameieon =
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIINbTEKwuO9ST9EQnzqeN9GMo2oXhpf00lY/lBQMs/j4";
  nephos =
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGmcxRVSli1cRYIC9LELJHoI13bE1+alCfD8cf/TNvZv";
  users = [ joseph-rsa ];
  systems = [ meletao tameieon nephos ];

in
{
  "cloudflare-cert.age".publicKeys = [ joseph-rsa nephos ];
  "dalabarge.age".publicKeys = systems ++ users;
  "WRT300N-DD.age".publicKeys = systems ++ users;
  "FTCNWKS.age".publicKeys = systems ++ users;
  "Phone.age".publicKeys = systems ++ users;
  "NHBC.age".publicKeys = systems ++ users;
  "NETGEAR09.age".publicKeys = systems ++ users;
  "NETGEAR09-5G.age".publicKeys = systems ++ users;
  "RAUB.age".publicKeys = systems ++ users;
  "Raub.age".publicKeys = systems ++ users;
  "Hearn.age".publicKeys = systems ++ users;
  "SpectrumSetup-64.age".publicKeys = systems ++ users;
  "Southland_Public.age".publicKeys = systems ++ users;
  "Here.age".publicKeys = systems ++ users;
  "4_Chips.age".publicKeys = systems ++ users;
  "wireless-env.age".publicKeys = systems ++ users;
  "ddclient-user.age".publicKeys = [ joseph-rsa nephos ];
  "ddclient-pass.age".publicKeys = [ joseph-rsa nephos ];
  "gitea-dbpass.age".publicKeys = [ joseph-rsa nephos ];

}
