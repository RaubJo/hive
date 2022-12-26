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
      ytui = "nix run github:gvolpe/ytui-music-nix";
      colmena = "nix run github:zhaofengli/colmena --";

      d = "direnv";
      g = "git";
      jc = "journalctl";
      sc = "systemctl";
      md = "mkdir -p";
      rd = "rmdir";

      n = "nix";
      np = "nix profile";
      ni = "np install";
      nr = "np remove";
      nf = "n flake";
      nepl = "n repl";

      "s" = "sudo";

      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      "....." = "cd ../../...";
    };
    shellAbbrs = {
      ydl = "youtube-dl";
      m = "math";
    };
    shellInit = "\n        starship init fish | source\n      ";
  };

}
