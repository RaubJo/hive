{ inputs, cell, }:
let
  init = { config, pkgs, lib, ... }: {
    imports = [
      cell.hardwareProfiles.thureos
      cell.nixosSuites.base
      cell.nixosSuites.guardian
    ];
    system.stateVersion = "23.05";
  };
in rec {
  bee.system = "armv7-linux";
  bee.pkgs = import inputs.nixos {
    inherit (inputs.nixpkgs) system;
    config.allowUnfree = true;
    overlays = [ ];
  };
  imports = [ init ];
}
