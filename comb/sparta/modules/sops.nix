{
  sops.defaultSopsFile = ../secrets/secrets.yaml;
  sops.age.keyFile = "/home/joseph/.config/sops/age/keys.txt";
  sops.secrets."passwords/root" = {};
  sops.secrets."passwords/joseph" = {};
}
