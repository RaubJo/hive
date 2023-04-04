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
      domainName = "bitwright.dev";
      httpPort = 3001;
      sshPort = 22;
      adminEmail = "JosephRaub98@gmail.com";
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
    cell.nixosSuites.gitea-server
    #cell.nixosSuites.web-server
  ];
}
