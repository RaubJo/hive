{
  description = "The Hive - The secretly open NixOS-Society";

  inputs = {
    std.url = "github:divnix/std";
    std.inputs.nixpkgs.follows = "nixpkgs";
    hive.url = "github:divnix/hive";
    hive.inputs.nixpkgs.follows = "nixpkgs";
  };

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

  inputs.std-data-collection.url = "github:divnix/std-data-collection";
  inputs.std-data-collection.inputs.std.follows = "std";
  inputs.std-data-collection.inputs.nixpkgs.follows = "nixpkgs";

  # tools
  inputs = {
    nixgl.url = "github:guibou/nixGL";
    nixgl.inputs.nixpkgs.follows = "nixpkgs";
    nixgl.inputs.flake-utils.follows = "std/flake-utils";

    nixos-hardware.url = "github:nixos/nixos-hardware";

    nixos-generators.url = "github:blaggacao/nixos-generators";
    nixos-generators.inputs.nixpkgs.follows = "nixpkgs";
    nixos-generators.inputs.nixlib.follows = "nixpkgs";

    colmena.url = "github:zhaofengli/colmena";
    colmena.inputs.nixpkgs.follows = "nixpkgs";
    colmena.inputs.stable.follows = "std/blank";
    colmena.inputs.flake-utils.follows = "std/flake-utils";

    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    agenix.url = "github:yaxitech/ragenix";
    agenix.inputs.nixpkgs.follows = "nixpkgs";

    nix-colors.url = "github:misterio77/nix-colors";

    treefmt-nix.url = "github:numtide/treefmt-nix";
  };

  inputs.hive.inputs = {
    nixos-generators.follows = "nixos-generators";
    colmena.follows = "colmena";
    disko.follows = "disko";
  };

  # nixpkgs & home-manager
  inputs = {
    nixos.follows = "nixos-unstable";
    home.follows = "home-unstable";

    nixos-22-11.url = "github:nixos/nixpkgs/release-22.11";
    home-22-11.url =
      "github:nix-community/home-manager/release-22.11";

    nixos-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-unstable.url = "github:nix-community/home-manager";
  };

  outputs = { std, hive, self, ... }@inputs:
    hive.growOn
      {
        inherit inputs;
        cellsFrom = ./comb;
        cellBlocks =
          # use blocktypes from both frameworkd
          with std.blockTypes;
          with hive.blockTypes; [
            # modules implement
            (functions "nixosModules")
            (functions "homeModules")
            (functions "devshellModules")

            # profiles activate
            (functions "hardwareProfiles")
            (functions "nixosProfiles")
            (functions "homeProfiles")
            (functions "devshellProfiles")

            # suites aggregate profiles
            (functions "nixosSuites")
            (functions "homeSuites")

            # configurations can be deployed
            nixosConfigurations
            colmenaConfigurations
            homeConfigurations
            diskoConfigurations

            # devshells can be entered
            (devshells "devshells")

            # jobs can be run
            (runnables "jobs")

            # library holds shared knowledge made code
            (functions "lib")
          ];
        nixpkgsConfig = { allowUnfree = true; };
      }
      # soil
      {
        packages.x86_64-linux = {
          inherit (inputs.disko.packages.x86_64-linux) disko;
        };
        packages.aarch64-linux = {
          inherit (inputs.disko.packages.aarch64-linux) disko;
        };
        devShells = std.harvest self [ "_ci" "devshells" ];
      }
      {
        colmenaHive = hive.collect self "colmenaConfigurations";
        nixosConfigurations = hive.collect self "nixosConfigurations";
        homeConfigurations = hive.collect self "homeConfigurations";
        diskoConfigurations = hive.collect self "diskoConfigurations";
        #disko doesn't support local flake URIs
        #https://github.com/nix-community/disko/issues/62
      };

  # --- Flake Local Nix Configuration ----------------------------
  # TODO: adopt spongix
  nixConfig = {
    extra-substituters = [
      "https://hyprland.cachix.org"
      "https://colmena.cachix.org"
      "https://nixpkgs-wayland.cachix.org"
      "https://cachix.org/api/v1/cache/emacs"
      "https://microvm.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nixpkgs-wayland.cachix.org-1:3lwxaILxMRkVhehr5StQprHdEo4IrE8sRho9R9HOLYA="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "colmena.cachix.org-1:7BzpDnjjH8ki2CT3f6GdOk7QAzPOl+1t3LvTLXqYcSg="
      "emacs.cachix.org-1:b1SMJNLY/mZF6GxQE+eDBeps7WnkT0Po55TAyzwOxTY="
      "microvm.cachix.org-1:oXnBc6hRE3eX5rSYdRyMYXnfzcCxC7yKPTbZXALsqys="
    ];
  };
  # --------------------------------------------------------------
}
