{ config, lib, options, pkgs, ... }:
with lib;
let cfg = config.smenos.servers.git;
in {
  options.smenos.servers.git = {
    enable = mkOption {
      default = false;
      type = types.bool;
      description = lib.mdDoc "Enable An Opinionated Git Server.";
    };
    domainName = mkOption {
      default = "bitwright.dev";
      type = types.str;
      description = lib.mdDoc
        "Domain name the server will run under. If this is a publicly accessible server this should be the FQDN otherwise the IP of the server should be fine.";
    };
    databasePasswordFile = mkOption {
      type = types.nullOr types.path;
      default = null;
      example = "/run/keys/gitea-dbpassword";
      description = lib.mdDoc ''
        A file containg the password corresponding to {option} `database.user`.
      '';
    };
    httpPort = mkOption {
      default = 3001;
      type = types.port;
    };
    sshPort = mkOption {
      default = 22;
      type = types.port;
    };
    stateDir = mkOption {
      default = "/var/lib/gitea";
      type = types.str;
      description = lib.mdDoc "Gitea data directory";
    };
    logLevel = mkOption {
      default = "Info";
      type = types.enum [ "Trace" "Debug" "Info" "Warn" "Error" "Critical" ];
      description = lib.mdDoc "General log level.";
    };
    acme = mkOption {
      default = true;
      type = types.bool;
      description = lib.mdDoc "Enable ACME security";
    };
    adminEmail = mkOption {
      default = null;
      type = types.nullOr types.str;
      example = "yourname@website.com";
      description = lib.mdDoc "Server administrator's email.";
    };
    dumping = mkOption {
      default = false;
      type = types.bool;
      description = lib.mdDoc "Whether to enable database dumping.";
    };
  };

  config = mkIf cfg.enable rec {
    services.gitea = {
      enable = true;
      domain = cfg.domainName;
      httpPort = cfg.httpPort;
      appName = builtins.concatStringsSep " " [ "Gitea at" cfg.domainName ];
      rootUrl = builtins.concatStringsSep "" [ "https://git." cfg.domainName ];
      database = {
        type = "postgres";
        passwordFile = cfg.databasePasswordFile;
      };
      settings = {
        service.DISABLE_REGISTRATION = false;
        session.COOKIE_SECURE = false;
        server.SSH_PORT = cfg.sshPort;
        server.DISABLE_SSH = if cfg.sshPort == null then true else false;
        log = {
          ROOT_PATH = "${cfg.stateDir}/log";
          LEVEL = cfg.logLevel;
        };
      };
      dump.enable = cfg.dumping;
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
        "${services.gitea.rootUrl}" = {
          locations."/".proxyPass =
            "http://localhost:${builtins.toString cfg.httpPort}";
        };
      };
    };
    security.acme = {
      acceptTerms = true;
      defaults.email = cfg.adminEmail;
    };

  };
}
