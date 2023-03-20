{ config, lib, pkgs, ... }:

{
  programs.password-store = {
    enable = true;
    settings = {
      PASSWORD_STORE_DIR = "/home/${config.home.username}/.password-store";
      PASSWORD_STORE_KEY = "josephraub98@gmail.com";
      PASSWORD_STORE_CLIP_TIME = "60";
    };
  };

}
