{ cell }:
let
  inherit (cell) nixosModules;
in
{
  gnome = with nixosModules; [ gnome gdm ];
  kde = with nixosModules; [ kde ];
  xmonad = with nixosModules; [ xmonad slick ];
  sway = with nixosModules; [ sway waybar gdm ];
  hyprland = with nixosModules; [ hyprland waybar gdm ];
  awesome = with nixosModules; [ awesome slick ];
}
