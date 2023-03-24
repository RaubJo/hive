{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nerdfonts

    # Study
    sword
    anki

    # Programming
    vscode

    # Multimedia
    vlc
    cmus
    pcmanfm
    zathura
    libreoffice-still
    calibre
    gimp
    evince
    pdfsam-basic
    font-manager
    mononoki

    # Emacs
    #texlive.combined.scheme-full

    #Tools
    rpi-imager
    deskew
    ffmpeg
    cdparanoia
    zip
    #makemkv
    lsdvd
    libdvdcss
    gnuplot
    easytag
    ddrescue
    gparted

  ];
}
