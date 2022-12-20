{ config, lib, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    shellAliases = {
      nv = "nvim";
      cls = "clear";
      pass = "pass -c";
      dl = "~/.scripts/dl.sh";
      lgr = "ledger";
      agenix = "nix run github:ryantm/agenix --";
      d = "direnv";
      g = "git";
      jc = "journalctl";
      sc = "systemctl";
      md = "mkdir -p";
      rd = "rmdir";
      n = "nix";
      "_" = "sudo";
      "..." = "../..";
      "...." = "../../..";
      "....." = "../../...";
    };
    shellAbbrs = {
      ydl = "youtube-dl";
      m = "math";
    };
    shellInit = "\n        starship init fish | source\n      ";
  };

}
