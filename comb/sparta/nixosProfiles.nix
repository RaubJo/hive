let
  inherit (inputs) nixpkgs;
  l = nixpkgs.lib // builtins;
in {
  base = { inputs, cell, config, pkgs, l, ... }: {
    imports = [
      ./modules/tailscale.nix
      ./modules/locale.nix
      ./modules/nix.nix
      ./modules/firewall.nix
      ./modules/fonts.nix
      ./modules/plymouth.nix
      ./modules/ssh.nix
      ./modules/printing.nix
      ./modules/env.nix
      ./modules/users.nix
    ];
  };
  laptop = { config, pkgs, l, ... }: { imports = [ ]; };
  server = { config, pkgs, l, ... }: { imports = [ ]; };
}
