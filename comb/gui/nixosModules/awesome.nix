{ inputs, cell }:
{
  services.xserver = {
    enable = true;
    windowManager.awesome = { enable = true; };
  };

}
