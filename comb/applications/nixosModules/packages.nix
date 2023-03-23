{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # terminal
    colmena
    udiskie
    numlockx
    usbutils
    lshw
    brightnessctl
    acpi

    docker
    docker-compose
    direnv

    # gui
    firefox
    vscode
    discord
    feh
    nerdfonts
  ];
}
