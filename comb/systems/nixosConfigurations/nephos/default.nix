{ inputs, cell, }:
let
  version = "23.05";
in
let
  init = { config, pkgs, lib, ... }: {
    imports = [
      cell.hardwareProfiles.nephos
    ];

    config.servers.git = {
      databasePasswordFile = config.age.secrets.gitea-dbpass.path;
    };

  };
in
rec {
  bee.system = "x86_64-linux";
  bee.home = inputs.home;
  bee.pkgs = import inputs.nixos {
    inherit (inputs.nixpkgs) system;
    config.allowUnfree = true;
  };
  imports = [
    init
    inputs.agenix.nixosModules.default
    #TODO: Determine which new modules to import
    #cell.nixosSuites.base, gitea-server, secrets,docker, ddclient, git and http custom modules
  ];
}
