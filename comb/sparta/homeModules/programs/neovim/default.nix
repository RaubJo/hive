{ config, lib, pkgs, ... }:

{
  neovim = {
    enable = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      vim-nix
      vim-airline
      vim-airline-themes
      nord-nvim
    ];
    extraConfig =
      "\n        colorscheme nord\n        let g:airline_theme='nord_minimal'\n        set number\n        set relativenumber\n      ";

  };

}
