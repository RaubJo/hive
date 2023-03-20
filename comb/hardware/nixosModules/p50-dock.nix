{ pkgs, ... }: {
  services.udev = {
    enable = true;
    extraRules = ''
      SUBSYSTEM=="usb", ACTION=="add", ATTRS{idProduct}=="1010", ATTRS{idVendor}=="17ef", ATTRS{bcdDevice}=="5040", RUN+="${pkgs.autorandr} --force -l docked"
      SUBSYSTEM=="usb", ACTION=="remove", ATTRS{idProduct}=="1010", ATTRS{idVendor}=="17ef", ATTRS{bcdDevice}=="5040", RUN+="${pkgs.autorandr} --force -l mobile"
    '';
  };
}
