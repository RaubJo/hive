{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    # CLI Tools
    bpytop # System overview
    asciinema # Record terminal session
    bat # A better cat
    libqalculate # qalc
    youtube-dl
    caffeine-ng
    unzip # .zip utility
    lynis # Security Auditing
    navi # Terminal Cheatsheets
    pv # pipeview
    authenticator
    tree
    bashmount
    ranger
    feh
    nerdfonts
    profont

    # CLI Fun
    neofetch
    figlet
    banner
    ttyper
    cli-visualizer

    # Study
    sword
    anki

    # Games
    rogue
    nethack
    harmonist
    crawl

    # Programming
    rustc
    rustfmt
    cargo

    cmake
    gcc
    gnumake
    libtool

    nixfmt

    sqliteman
    sqlite

    # 3D printing
    prusa-slicer
    openscad
    #freecad

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

    # DE
    conky
    yad
    libnotify
    xclip
    xdotool
    xorg.xhost
    xorg.xinit
    xorg.xwininfo
    lxappearance
    gnome.adwaita-icon-theme

    # Emacs
    coreutils
    ripgrep
    fd
    ispell
    #texlive.combined.scheme-full
    libvterm
    sqlite
    languagetool
    ledger
    shellcheck
    imagemagick
    graphviz

    #Networking
    tailscale
    openssl
    mkcert

    #Tools
    rpi-imager
    shutter
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
