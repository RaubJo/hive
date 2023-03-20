{ pkgs, ... }: {
  home.packages = with pkgs; [
    elmPackages.elm
    elm2nix
    elmPackages.elm-live
    elmPackages.elm-review
    elmPackages.elm-format
    elmPackages.create-elm-app
  ];
}
