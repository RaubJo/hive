{ config, lib, pkgs, ... }:

{
  imports = [
    ./common.nix
    ./zram.nix
    ./zfs.nix
    ./ephemeral/users.nix
    ./ephemeral/fileSystem.nix
  ];
}
