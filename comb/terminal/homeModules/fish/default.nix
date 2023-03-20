{ config, lib, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    shellAliases = {
      nv = "nvim";
      cls = "clear";
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
      ni = "nix profile install";
      nr = "nix profile remove";
      nf = "nix flake";
      nepl = "nix repl";
      nd = "nix develop";

      m = "math";

      "S" = "sudo";

      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      "....." = "cd ../../...";
    };
    shellAbbrs = {
      ydl = "youtube-dl";
    };
    shellInit = "\n        starship init fish | source \n     ";
  };

}
