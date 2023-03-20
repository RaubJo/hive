{ config, pkgs, ... }: {
  users = {
    mutableUsers = false;
    users = {
      root = {
        hashedPassword =
          "$6$tNyYLYGxyzydAdhD$0EmLRGrPupIGpD4pJPZrDkZdpZ6OVEVgGv2lTiebKAlzXZbRi3kWbfQwCjXQbZfWBz7/lv8wr7IB0JpZu4uUu1";
        openssh.authorizedKeys.keys = [
          "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCuAkGqx5yNT2+ZO7SRGfNVxh+4qb3YhEBsntTAMpdLjrmJTAtgDqdigjXosuAlHVUVjTQeWLQbk1kfRxaI4VA9Nj9uROTY3lhlwNtvhLxYumwRrKZ2j95lY8nAtaDSNHfg8MPMkVHXGi+8imSZEGyKx4p4V65RrOvMTYFP144OFdoIln1AjWuUf2/c4oBS0MESz0gECzexy4//gZv38GDyug0N/7vUkfl5lceIRQjIAtRgxM7qdifoFJCRHCdc1PP7wXfNMpAcYNd0rWjXQNrbQrvTG/RJwoN4Y/G0ZVKtQbLfpXD3QovFl7CcymX9/roJGfKdkHu4VfHSdZ5WZbuJwVsBEDwMpELz9uoLYEeYNu/qHPdl11STsKl9F9K7rkkF68k2iJxv+MRsCQQojyzryQHoVFnV3FwGg69gemVKyMExKfpDR0zBfIbw4Ky7m3PeMzg9dTytMCx/fK4iuNvXjiu2tX6jjsVnWcpqLwCj3BiLkA2Lia1rdRYXzofxgp8= joseph@meletao"
        ];
      };
      joseph = {
        isNormalUser = true;
        shell = pkgs.fish;
        hashedPassword =
          "$6$4G0jsFOpNMPy67xF$IMlFKPvMAneGQKTpri7vT6oYMZPql7A0ZAWAIg1VHqVU6ZUYhuhswpRrmXsKesuT8gJ8wUelBWkad8KR0eize0";
        extraGroups = [
          "wheel"
          "mysql"
          "video"
          "dialout"
          "docker"
          "libvirtd"
        ];
      };
    };
  };
  # This eliminates the need to type my password for sudo
  security.sudo.extraRules = [{
    users = [ "joseph" ];
    commands = [{
      command = "ALL";
      options = [ "SETENV" "NOPASSWD" ];
    }];
  }];
}
