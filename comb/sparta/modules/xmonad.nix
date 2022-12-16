{ config, lib, pkgs, ... }:

{
  imports = [ ./graphical/userSession.nix ../scripts/xmo-scripts.nix ];
}
