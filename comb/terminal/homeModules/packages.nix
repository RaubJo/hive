{ pkgs, ... }: {
  home.packages = with pkgs; [
    eva
    ijq
    fx # jq, but don't admit you somtimes like to use a mouse
    ripgrep
    fd # A find replacement
    duf # df
    sd # A modern sed
    choose # between cut & awk - beautiful
    curlie # modern curl
    du-dust # modern du
    magic-wormhole # secure file sharing over cli
    navi # interactive cli cheat sheet with cheat.sh / tldr integration
    watchexec # Executes commands in response to file modifications
    manix # explore nixos/hm options
    borgbackup # backup tool
    just
    unzip
    lynis
    bashmount
    pv
    asciinema
    yt-dlp
    tree
    ranger
    neofetch
  ];

}
