{
  description = "A Nix-flake-based Node.js development environment";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs";
  };

  outputs = { flake-utils, nixpkgs }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        overlays = [
          (_self: super: rec {
            nodejs = super.nodejs-18_x;
            pnpm = super.nodePackages.pnpm;
            yarn = (super.yarn.override { inherit nodejs; });
          })
        ];
        pkgs = import nixpkgs { inherit overlays system; };
      in {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [ node2nix nodejs pnpm yarn ];

          shellHook = ''
            echo "node `${pkgs.nodejs}/bin/node --version`"
          '';
        };
      });
}
