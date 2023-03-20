{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # terminal
    colmena
    udiskie
    numlockx
    usbutils
    htop
    lshw
    git
    neovim
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
  ];
}
