let inherit (inputs) hyprland;
in {
  hyprland = hyprland.overlays.default;
  discordASAR = _self: super: {
    discord = super.discord.override { withOpenASAR = true; };
  };

}
