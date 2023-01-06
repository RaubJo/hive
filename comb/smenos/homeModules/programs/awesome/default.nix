{ config, lib, pkgs, ... }:

{
  xsession.windowManager.awesome = {
    enable = true;
    #package;
    luaModules = with pkgs.luaPackages; [ luarocks ];

  };
}
