# Not all development is software...
{ pkgs, ... }: {
  home.packages = with pkgs; [
    prusa-slicer
    openscad
    freecad
  ];
}
