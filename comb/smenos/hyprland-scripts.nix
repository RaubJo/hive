{ config, pkgs, ... }:
let
  wrappedhl = pkgs.writeShellScriptBin "wrappedhl" ''
    #!/usr/bin/env bash
    cd ~
    export _JAVA_AWT_WM_NONREPARENTING=1
    export XCURSOR_SIZE=24

    exec Hyperland
  '';
in { environment.systemPackages = [ wrappedhl ]; }
