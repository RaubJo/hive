let
  inherit (cell) homeModules homeProfiles;
in
{
  xmonad = with homeModules; [ xmonad xmobar ] ++
    [ homeProfiles.nix-colors ];
  hyprland = with homeModules;[ hyprland waybar ];
  sway = with homeModules;[ sway waybar ];
  awesome = with homeModules;[ awesome ] ++
    [ homeProfiles.nix-colors ];
}
