{ config, lib, pkgs, ... }:

{
  programs.doom-emacs = {
    enable = true;
    dooPrivateDir = ./doom.d;
  };
}
