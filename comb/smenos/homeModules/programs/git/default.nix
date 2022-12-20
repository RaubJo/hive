{ config, lib, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Joseph Raub";
    userEmail = "josephraub98@gmail.com";
  };
}
