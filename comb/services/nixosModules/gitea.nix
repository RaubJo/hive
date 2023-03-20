i { config, pkgs, ... }: {
  services.gitea = {
    enable = true;
    appName = "Gitea at Bitwright.dev";
    database = {
      type = "postgres";
      passwordFile = pkgs.writeText "dbPassword" "test1234";
    };
    domain = "bitwright.dev";
    rootUrl = "https://git.bitwright.dev/";
    httpPort = 3001;
    settings = {
      service.DISABLE_REGISTRATION = false;
      session.COOKIE_SECURE = false;
      server = {
        SSH_PORT = 22;
        DISABLE_SSH = false;
      };
      log = {
        ROOT_PATH = "${config.services.gitea.stateDir}/log";
        LEVEL = "Info";
      };
    };
    extraConfig = ''
      #https://docs.gitea.io/en-us/config-cheat-sheet/#service-service
      RUN_MODE = prod
      [service]
      SHOW_REGISTRATION_BUTTON=false
    '';
  };

  services.postgresql = {
    enable = true;
    authentication = ''
      local gitea all ident map=gitea-users
    '';
    identMap = ''
      gitea-users gitea gitea
    '';
  };

  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    recommendedOptimisation = true;
    recommendedGzipSettings = true;
    recommendedBrotliSettings = true;
    virtualHosts = {
      "git.bitwright.dev" = {
        locations."/".proxyPass = "http://localhost:3001";
      };
      "bitwright.dev" = {
        addSSL = true;
        enableACME = true;
        #root = "/var/www/bitwright.dev";
        locations = { "/".root = "/var/www/bitwright.dev"; };
      };

    };
  };

  security.acme = {
    acceptTerms = true;
    defaults.email = "josephraub98@gmail.com";
  };
}
