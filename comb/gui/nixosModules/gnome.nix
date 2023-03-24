{ cell }:
{
  services.xserver = {
    enable = true;
    layout = "us";
    libinput.enable = true;
    # displayManager.autoLogin.enable = true;
    # displayManager.autoLogin.user = "joseph";
  };
}
