{ config, lib, ... }:
with lib;
let cfg = config.queen;
in {

  options.queen = { enable = mkEnableOption "Enable a Queen role in Hive."; };

  config = mkIf cfg.enable { };

}
