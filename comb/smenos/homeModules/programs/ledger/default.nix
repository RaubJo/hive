{ ... }:

{
  programs.ledger = {
    enable = true;
    extraConfig = ''
      --file ~/org/finances/2023.ledger
    '';
  };
}
