{ config, lib, pkgs, ... }:
with lib;
let cfg = config.wireless;
in {
  options.wireless = {
    enable = mkEnableOption "Enable wireless configuration.";
    flavor = mkOption { default = "wpa-supplicant"; };
  };

  config = mkIf cfg.enable {
    config.networking.networkmanager.enable = mkIf cfg.flavor
      == "networkmanager" true;
  };
}
