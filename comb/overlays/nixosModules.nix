{
  discordASAR = _self: super: {
    discord = super.discord.override { withOpenASAR = true; };
  };
}
