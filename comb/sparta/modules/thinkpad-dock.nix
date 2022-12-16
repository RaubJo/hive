{ pkgs, ... }:

let
  thinkpad-dock = pkgs.writeShellScriptBin "thinkpad-dock" ''
    #!/usr/bin/env bash

    autorandr -c --force
    '';
in {
  environment.systemPackages = [ thinkpad-dock ];
}
