#TODO: Diversify these packages into different web-langs
{ pkgs, ... }: {
  home.packages = with pkgs; [
    #webtools
    sqlite
    sqliteman
    mkcert
    openssl
    #php - php-env flake
    php82
    phpunit
    nodePackages.intelephense
    # ?
    nodejs
    nodePackages.npm
    #nodePackages.vscode-html-languageserver-bin
    #nodePackages.vscode-css-languageserver-bin
    #nodePackages.vscode-json-languageserver-bin
    nodePackages.vscode-langservers-extracted
    nodePackages.typescript-language-server
  ];
}
