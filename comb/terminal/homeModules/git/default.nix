{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Joseph Raub";
    userEmail = "josephraub98@gmail.com";
    signing = {
      #gpgPath = "${pkgs.gpg}/bin/gpg";
      key = null;
    };
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
  };
}
