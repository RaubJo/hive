let inherit (inputs) hyprland;
in {
  hyprland = hyprland.overlays.default;
  discordASAR = self: super: {
    discord = super.discord.override { withOpenASAR = true; };
  };

}
