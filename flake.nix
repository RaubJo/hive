{
  description = "My NixOs Hive";

  inputs.std.url = "github:divnix/std";
  inputs.std.inputs.nixpkgs.follows = "nixpkgs";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

  # tools
  inputs = {
    nixos-generators.url = "github:blaggacao/nixos-generators";
    nixos-generators.inputs.nixpkgs.follows = "nixpkgs";
    nixos-generators.inputs.nixlib.follows = "nixpkgs";

    colmena.url = "github:zhaofengli/colmena";
    colmena.inputs.nixpkgs.follows = "nixpkgs";
    colmena.inputs.stable.follows = "std/blank";
    colmena.inputs.flake-utils.follows = "std/flake-utils";

    nixgl.url = "github:guibou/nixGL";
    nixgl.inputs.nixpkgs.follows = "nixpkgs";
    nixgl.inputs.flake-utils.follows = "std/flake-utils";

    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    nixos-hardware.url = "github:nixos/nixos-hardware";

    nix-colors.url = "github:misterio77/nix-colors";

    hyprland.url = "github:hyprwm/hyprland";
    hyprland.inputs.nixpkgs.follows = "nixpkgs";

    doom-emacs.url = "github:nix-community/nix-doom-emacs";
    doom-emacs.inputs.nixpkgs.follows = "nixpkgs";

    agenix.url = "github:ryantm/agenix";
    agenix.inputs.nixpkgs.follows = "nixpkgs";

    ragenix.url = "github:yaxitech/ragenix";
    ragenix.inputs.nixpkgs.follows = "nixpkgs";
  };

  # nixpkgs & home-manager
  inputs = {
    nixos.follows = "nixos-unstable";
    home.follows = "home-unstable";

    nixos-22-11.url = "github:nixos/nixpkgs/release-22.11";
    home-22-11.url = "github:nix-community/home-manager/release-22.11";

    nixos-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-unstable.url = "github:nix-community/home-manager";
  };

  outputs = { std, self, ... }@inputs:
    std.growOn {
      inherit inputs;
      cellsFrom = ./comb;
      # debug = ["cells" "x86_64-linux"];
      cellBlocks = with std.blockTypes; [
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
        (data "nixosConfigurations")
        (data "colmenaConfigurations")
        (data "homeConfigurations")
        (data "diskoConfigurations")

        # devshells can be entered
        (devshells "devshells")

        # jobs can be run
        (runnables "jobs")

        # library holds shared knowledge made code
        (functions "library")
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

      #devShells = std.harvest self [ "_QUEEN" "devshells" ];
    } {
      # tool: colmena -- "fill the jar on the soil with the honey!"
      colmenaHive = let
        makeHoneyFrom = import ./make-honey.nix {
          inherit (inputs) colmena nixpkgs;
          cellBlock = "colmenaConfigurations";
        };
      in makeHoneyFrom self;

      # tool: nixos-generators -- "get drunk like a bear!"
      nixosConfigurations = let
        makeMeadFrom = import ./make-mead.nix {
          inherit (inputs) nixpkgs;
          cellBlock = "nixosConfigurations";
        };
      in makeMeadFrom self;

      # tool: home-manager -- "drunken sailor, sunken sailor; honeymoon pantaloon."
      homeConfigurations = let
        makeMoonshineFrom = import ./make-moonshine.nix {
          inherit (inputs) nixpkgs;
          cellBlock = "homeConfigurations";
        };
      in makeMoonshineFrom self;

      # tool: disko -- "Tiganizatia, tiganizatia - disko, disko partizani."
      diskoConfigurations = let
        makeShantyFrom = import ./make-shanty.nix {
          inherit (inputs) nixpkgs;
          cellBlock = "diskoConfigurations";
        };
      in makeShantyFrom self;
    };

  # --- Flake Local Nix Configuration ----------------------------
  # TODO: adopt spongix
  #nixConfig = {
  #  extra-substituters = [ ];
  #  extra-trusted-public-keys = [ ];
  #};
  # --------------------------------------------------------------
}
