{ pkgs, ... }: {
  # This profile describes server(s) administrator account
  users.mutableUsers = false;
  users.users.root.hashedPassword =
    "$6$ZkRkSb5ivwvFrWui$GDJeJvApQ7U55cf95gj.WtTUh.0NkGOJL4D5qZmRNZFZ6AfICzaBoqekCZo3KD2bUMrCRRaeeJ51/aQDo6BNQ/";
  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCuAkGqx5yNT2+ZO7SRGfNVxh+4qb3YhEBsntTAMpdLjrmJTAtgDqdigjXosuAlHVUVjTQeWLQbk1kfRxaI4VA9Nj9uROTY3lhlwNtvhLxYumwRrKZ2j95lY8nAtaDSNHfg8MPMkVHXGi+8imSZEGyKx4p4V65RrOvMTYFP144OFdoIln1AjWuUf2/c4oBS0MESz0gECzexy4//gZv38GDyug0N/7vUkfl5lceIRQjIAtRgxM7qdifoFJCRHCdc1PP7wXfNMpAcYNd0rWjXQNrbQrvTG/RJwoN4Y/G0ZVKtQbLfpXD3QovFl7CcymX9/roJGfKdkHu4VfHSdZ5WZbuJwVsBEDwMpELz9uoLYEeYNu/qHPdl11STsKl9F9K7rkkF68k2iJxv+MRsCQQojyzryQHoVFnV3FwGg69gemVKyMExKfpDR0zBfIbw4Ky7m3PeMzg9dTytMCx/fK4iuNvXjiu2tX6jjsVnWcpqLwCj3BiLkA2Lia1rdRYXzofxgp8= joseph@meletao"
  ];
  users.users.kurios = {
    isNormalUser = true;
    shell = pkgs.fish;
    hashedPassword =
      "$6$BO.9zW.3miRB4vNH$ixlr4ue0MYnaQbtKRzncjOHg25DFbm3MvjfD4GIC4.12HDCRlzh2B/X6zPtoa4ExjOoCQu8oxtCnSv3vjdBid.";
    extraGroups = [ "wheel" "docker" "cloudflared" ];
    packages = with pkgs; [ git wget neovim ];
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCuAkGqx5yNT2+ZO7SRGfNVxh+4qb3YhEBsntTAMpdLjrmJTAtgDqdigjXosuAlHVUVjTQeWLQbk1kfRxaI4VA9Nj9uROTY3lhlwNtvhLxYumwRrKZ2j95lY8nAtaDSNHfg8MPMkVHXGi+8imSZEGyKx4p4V65RrOvMTYFP144OFdoIln1AjWuUf2/c4oBS0MESz0gECzexy4//gZv38GDyug0N/7vUkfl5lceIRQjIAtRgxM7qdifoFJCRHCdc1PP7wXfNMpAcYNd0rWjXQNrbQrvTG/RJwoN4Y/G0ZVKtQbLfpXD3QovFl7CcymX9/roJGfKdkHu4VfHSdZ5WZbuJwVsBEDwMpELz9uoLYEeYNu/qHPdl11STsKl9F9K7rkkF68k2iJxv+MRsCQQojyzryQHoVFnV3FwGg69gemVKyMExKfpDR0zBfIbw4Ky7m3PeMzg9dTytMCx/fK4iuNvXjiu2tX6jjsVnWcpqLwCj3BiLkA2Lia1rdRYXzofxgp8= joseph@meletao"
    ];
  };
}
