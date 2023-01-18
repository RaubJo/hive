{ config, lib, pkgs, ... }:

{
  xsession.windowManager.awesome = {
    enable = true;
    package = pkgs.awesome;
    luaModules = with pkgs.luaPackages; [ luarocks ];
  };
}
