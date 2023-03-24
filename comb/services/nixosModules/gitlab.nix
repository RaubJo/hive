{ pkgs, ... }: {
  services.gitlab = {
    enable = true;
    databasePasswordFile = pkgs.writeText "dbPassword" "test123";
    databaseCreateLocally = true;
    initialRootEmail = "admin@local.host";
    initialRootPasswordFile = pkgs.writeText "rootPassword" "test1234";
    secrets = {
      secretFile = pkgs.writeText "secret" "Aig5zaic";
      otpFile = pkgs.writeText "otpsecret" "Riew9mue";
      dbFile = pkgs.writeText "dbsecret" "we2quaeZ";
      jwsFile = pkgs.runCommand "oidcKeyBase" { }
        "${pkgs.openssl}/bin/openssl genrsa 2048 > $out";
    };
  };

  services.postgresql = {
    enable = true;
    port = 5432;
    identMap = ''
      gitlab-users gitlab postgres
    '';
    ensureUsers = [{ name = "gitlab"; }];
  };

  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    virtualHosts = {
      localhost = {
        locations."/".proxyPass =
          "http://unix:/run/gitlab/gitlab-workhorse.socket";

      };
    };

  };

  environment.systemPackages = with pkgs; [ openssl ];
  systemd.services.gitlab-backp.environment.BACKUP = "dump";

}
