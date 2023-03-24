{
  drone-ci = { config, pkgs, ... }: {
    systemd.services.drone-server = {
      wantedBy = [ "multi-user.target" ];
      serviceConfig = {
        EnvironmentFile = [
          #age.secrest.drone.path
        ];
        Environment = [
          "DRONE_DATABASE_DATASOURCE=postgres:///droneserver?host=/run/postgresql"
          "DRONE_DATABASE_DRIVER=postgres"
          "DRONE_SERVER_PORT=:3030"
          "DRONE_USER_CREATE=username:viperML,admin:true"

          "DRONE_GITEA_SERVER=https://git.bitwright.dev"
          "DRONE_SERVER_HOST=drone.bitwright.dev"
          "DRONE_SERVER_PROTO=https"
        ];
        ExecStart = "${pkgs.drone}/bin/drone-server";
        User = "droneserver";
        Group = "droneserver";
      };
    };
    users.users.drone-runner-docker = {
      isSystemUser = true;
      group = "drone-runner-docker";
    };
    users.groups.drone-runner-docker = { };
    users.groups.docker.members = [ "drone-runner-docker" ];

    systemd.services.drone-runner-docker = {
      enable = true;
      wantedBy = [ "multi-user.target" ];
      restartIfChanged = false;
      serviceConfig = {
        Environment = [
          "DRONE_RPC_PROTO=http"
          "DRONE_RPC_HOST=localhost:3030"
          "DRONE_RUNNER_CAPACITY=2"
          "DRONE_RUNNER_NAME=drone-runner-docker"
        ];
        EnvironmentFile = [
          #age.secrets.drone.path;
        ];
        ExecStart = "${pkgs.drone-runner-docker}/bin/drone-runner-docker";
        User = "drone-runner-docker";
        Group = "drone-runer-docker";
      };
    };

    users.users.drone-runner-exec = {
      isSystemUser = true;
      group = "drone-runner-exec";
    };
    users.groups.drone-runner-exec = { };
    # Allow the exec runner to write to build with nix
    nix.allowedUsers = [ "drone-runner-exec" ];

    systemd.services.drone-runner-exec = {
      enable = true;
      wantedBy = [ "multi-user.target" ];
      ### MANUALLY RESTART SERVICE IF CHANGED
      restartIfChanged = true;
      confinement.enable = true;
      confinement.packages =
        [ pkgs.git pkgs.gnutar pkgs.bash pkgs.nixFlakes pkgs.gzip ];
      path = [ pkgs.git pkgs.gnutar pkgs.bash pkgs.nixFlakes pkgs.gzip ];
      serviceConfig = {
        Environment = [
          "DRONE_RPC_PROTO=http"
          "DRONE_RPC_HOST=127.0.0.1:3030"
          "DRONE_RUNNER_CAPACITY=2"
          "DRONE_RUNNER_NAME=drone-runner-exec"
          "NIX_REMOTE=daemon"
          "PAGER=cat"
          "DRONE_DEBUG=true"
        ];
        BindPaths = [
          "/nix/var/nix/daemon-socket/socket"
          "/run/nscd/socket"
          # "/var/lib/drone"
        ];
        BindReadOnlyPaths = [
          "/etc/passwd:/etc/passwd"
          "/etc/group:/etc/group"
          "/nix/var/nix/profiles/system/etc/nix:/etc/nix"
          "${
            config.environment.etc."ssl/certs/ca-certificates.crt".source
          }:/etc/ssl/certs/ca-certificates.crt"
          "${
            config.environment.etc."ssh/ssh_known_hosts".source
          }:/etc/ssh/ssh_known_hosts"
          "${
            builtins.toFile "ssh_config" ''
              Host git.bitwright.dev
              ForwardAgent yes
            ''
          }:/etc/ssh/ssh_config"
          "/etc/machine-id"
          "/etc/resolv.conf"
          "/nix/"
        ];
        EnvironmentFile = [
          # config.sops.secrets.drone.path
        ];
        ExecStart = "${pkgs.drone-runner-exec}/bin/drone-runner-exec";
        User = "drone-runner-exec";
        Group = "drone-runner-exec";
      };
    };

    virtualisation.docker = { enable = true; };
  };

  secrets = { age.secrets.gitea-dbpass.file = ./secrets/gitea-dbpass.age; };

  # Custom Modules
}
