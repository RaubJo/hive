{ pkgs, ... }: {
  home.packages = with pkgs; [
    nixfmt
    alejandra
    #rnix-lsp #nix language server
  ];
}
