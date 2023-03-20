{ config, ... }: {
  documentation = {
    enable = true;
    man.enable = true;
    nixos.enable = false;
  };
}
