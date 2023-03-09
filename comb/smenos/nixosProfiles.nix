let
  inherit (inputs) hyprland nixpkgs;
  lib = nixpkgs.lib // builtins;
in {
  # Networking #
  firewall = { config, ... }: {
    networking.firewall = {
      enable = true;
      checkReversePath = "loose";
      allowedTCPPorts = [ 22 80 443 3001 ];
      allowedUDPPorts = [ 53 80 443 3001 ];
    };
  };

  wpa-networks = { config, ... }: {
    networking = {
      networkmanager.enable = false;
      wireless = {
        enable = true;
        userControlled.enable = true;
        userControlled.group = "wheel";
        networks = {
          "WRT300N-DD" = {
            pskRaw =
              "01615c3307d6bc6c8ba8113df877604fc5bfc4bf5c79e9580420e1f9d8fa43c8";
          };
          FTCNWKS = {
            pskRaw =
              "67465f1716ee60c76d89a05c3b1015e87889961064aa13c6299a0b3e465723ae";
          };
          Phone = {
            pskRaw =
              "4206780088dbc2528e3c8426ab9dfd7c6e7b0d3c6ec161897a975633ae04bc43";
            priority = 5;
          };
          NHBC = {
            pskRaw =
              "b0695d90f6630f9618ffcfde2fa33b7f72316fc41ac156d4c9020d3727097089";
            priority = 4;
          };
          NETGEAR09 = {
            pskRaw =
              "2ef892d3c4497bd656eee36468170fb5f1ffc707bfffc5ca0676ab51992dbeca";
          };
          NETGEAR09-5G = {
            pskRaw =
              "9b7e5b1cd33d135285b45c174b521e1232b884f8960599f06654865d4f03c8fb";
            priority = 4;
          };
          RAUB = {
            pskRaw =
              "cc589f9341298c99e1e302987fb6051adfa5f16a7ceb253faac3fe467d3b8e15";
          };
          Raub = {
            pskRaw =
              "30152cb984de3fafec99ab6a8db9479671cc7d97a83951a24eaea60b8b0ffca4";
          };
          Hearn = {
            pskRaw =
              "0427cc1ce2482b8a3fed13991403e27579492c343766be76cdbed0a723b3bbf4";
          };
          SpectrumSetup-64 = {
            pskRaw =
              "3137ea7591b8948c72cc14f09662d8e07d4332f3ae6a3df8466b1cc8dc3947e9";
          };
          "Southland Public" = {
            pskRaw =
              "2fcafd19719819c614aca984b379f0cd2887f177b0bb1c5aa1b67423c5b28e74";
          };
          Here = {
            pskRaw =
              "308393ef5547f39cc27d13e888939162ada177d75a6518acbaa2ba79a3ec55eb";
          };
          "4_Chips" = {
            pskRaw =
              "9436e7d312766b7545f863b95c821cc5e66d2f2f295e152928d22122399c788b";
          };
        };
      };
    };
  };

  nm-networks = { config, ... }: {
    networking = {
      networkmanager = {
        enable = true;
        # https://unix.stackexchange.com/questions/22367/where-are-networkmanagers-wifi-settings-stored
      };
    };
  };

  # Desktop Environments #
  gnome = { config, ... }: {
    services.xserver = {
      enable = true;
      layout = "us";
      libinput.enable = true;
      displayManager.gdm.enable = true;
      displayManager.autoLogin.enable = true;
      displayManager.autoLogin.user = "joseph";
      desktopManager.gnome.enable = true;

    };
  };

  kde = { config, pkgs, ... }: {
    services.xserver = {
      enable = true;
      layout = "us";
      libinput.enable = true;
      displayManager.sddm.enable = true;
      desktopManager.plasma5.enable = true;
      desktopManager.plasma5.excludePackages = with pkgs.libsForQt5; [
        elisa
        gwenview
        khelpcenter
      ];
    };
  };

  awesome = { config, ... }: {
    services.xserver = {
      enable = true;
      layout = "us";
      libinput.enable = true;
      displayManager = {
        lightdm.enable = true;
        lightdm.greeters.slick.enable = true;
        lightdm.background = ./images/background/snow_mountains.jpg;
      };
      windowManager.awesome = { enable = true; };
    };
  };

  xmonad = { config, ... }: {
    imports = [ ./xmo-scripts.nix ];
    services.xserver = {
      enable = true;
      layout = "us";
      libinput.enable = true;
      displayManager = {
        lightdm.enable = true;
        lightdm.greeters.slick.enable = true;
        lightdm.background = ./images/backgrounds/snow_mountains.jpg;
      };
      windowManager.xmonad = {
        enable = true;
        enableContribAndExtras = true;
      };
    };
  };

  laptop-resolutions = { config, ... }: {
    hardware.video.hidpi.enable = true;
    services.xserver = {
      dpi = 96;
      resolutions = [{
        x = 1920;
        y = 1080;
      }];
      xrandrHeads = [{
        output = "eDP1-1";
        primary = true;
      }];
    };
  };

  sway = { pkgs, ... }: {
    programs.sway = {
      enable = true;
      wrapperFeatures.gtk = true;
      extraPackages = with pkgs; [
        xwayland
        gsettings-desktop-schemas
        autotiling
        wev
      ];
    };
    programs.waybar.enable = true;
    services.xserver = {
      enable = true;
      displayManager = {
        gdm.enable = true;
        gdm.wayland = true;
        defaultSession = "sway";
      };
    };
  };

  hyprland = { pkgs, ... }: {
    imports = [ ./hyprland-scripts.nix inputs.hyprland.nixosModules.default ];
    programs.hyprland.enable = true;
    services.xserver.enable = true;
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.displayManager.gdm.wayland = true;
    services.xserver.displayManager.defaultSession = "hyprland";
    programs.waybar.enable = true;
    environment.systemPackages = with pkgs; [ wev ];
  };

  ### Web Services ###
  hydra = { config, ... }: {
    services.hydra = {
      enable = true;
      hydraURL = "https://localhost:80";
      notificationSender = "hydra@localhost";
      buildMachinesFiles = [ ];
      useSubstitues = true;
    };
  };

  minidlna = { config, ... }: {
    services.minidlna = {
      enable = true;
      settings = {
        port = 6000;
        inotify = "no";
        notify_interval = 90000;
        wide_links = "no";
        root_container = ".";
        media_dir = [ "/home/joseph/library" ];
        log_level = "warn";
        friendly_name = "optiplex";
        enable_tivo = "no";
        db_dir = "/var/cache/minidlna";
      };
      openFirewall = true;
    };
  };

  nextcloud = { config, pkgs, ... }: {
    services.nextcloud = {
      enable = true;
      package = pkgs.nextcloud25;
      hostName = "localhost";
      config.adminpassFile = "${pkgs.writeText "adminpass" "123456"}";
      #config.extraTrustedDomains = [];
      # This value should be set in the system specific config because of unique ip addresses
      appstoreEnable = true;
      enableImagemagick = true;
    };
    # The nextcloud module, unless specified, uses nginx to serve the site.
    # Add ACME?
  };

  ### Systemwide Configurations ####
  fonts = { config, pkgs, ... }: {
    fonts = {
      fonts = with pkgs; [
        (nerdfonts.override { fonts = [ "SourceCodePro" "Mononoki" ]; })
        noto-fonts
        noto-fonts-emoji
        mplus-outline-fonts.githubRelease
        liberation_ttf
        dejavu_fonts
      ];
      enableGhostscriptFonts = true;

      fontconfig = {
        enable = true;
        defaultFonts = {
          monospace = [ "Noto Sans Mono Regular" ];
          sansSerif = [ "Noto Sans Display Regular" ];
          serif = [ "Noto Serif Regular" ];
        };
      };
    };
  };

  locale = { config, ... }: {
    time.timeZone = "America/Chicago";
    i18n.defaultLocale = "en_US.UTF-8";
    console = {
      font = "Lat2-Terminus16";
      keyMap = "us";
    };
  };

  minify = { config, ... }: {
    documentation = {
      enable = true;
      man.enable = true;
      nixos.enable = false;
    };
  };

  nix = { config, pkgs, ... }: {
    nix = {
      package = pkgs.nixVersions.stable;
      extraOptions = ''
        experimental-features = nix-command flakes
      '';
      settings.auto-optimise-store = true;
      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 7d";
      };
    };
  };

  nvidia = { config, pkgs, ... }: {
    imports = [ ./nvidiaScripts.nix ];
    services.xserver.videoDrivers = [ "nvidia" ];
    hardware.nvidia = {
      modesetting.enable = true;
      package = config.boot.kernelPackages.nvidiaPackages.latest;
      prime.sync.enable = true;
      prime = {
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };
  };

  printing = { config, pkgs, ... }: {
    services.printing = {
      enable = true;
      drivers = [ pkgs.gutenprint ];
      browsing = true;
      listenAddresses = [ "localhost:631" ];
      allowFrom = [ "all" ];
    };
    services.avahi = {
      enable = true;
      publish.enable = true;
      publish.userServices = true;
    };
  };

  packages = { config, pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      colmena
      udiskie
      usbutils
      htop
      lshw
      git
      neovim
      brightnessctl
      acpi
      firefox
      docker
      docker-compose
      direnv
      vscode
    ];
  };

  plymouth = { config, ... }: { boot.plymouth = { enable = true; }; };

  users = { config, pkgs, ... }: {
    users = {
      mutableUsers = false;
      users = {
        root = {
          hashedPassword =
            "$6$tNyYLYGxyzydAdhD$0EmLRGrPupIGpD4pJPZrDkZdpZ6OVEVgGv2lTiebKAlzXZbRi3kWbfQwCjXQbZfWBz7/lv8wr7IB0JpZu4uUu1";
          openssh.authorizedKeys.keys = [
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCuAkGqx5yNT2+ZO7SRGfNVxh+4qb3YhEBsntTAMpdLjrmJTAtgDqdigjXosuAlHVUVjTQeWLQbk1kfRxaI4VA9Nj9uROTY3lhlwNtvhLxYumwRrKZ2j95lY8nAtaDSNHfg8MPMkVHXGi+8imSZEGyKx4p4V65RrOvMTYFP144OFdoIln1AjWuUf2/c4oBS0MESz0gECzexy4//gZv38GDyug0N/7vUkfl5lceIRQjIAtRgxM7qdifoFJCRHCdc1PP7wXfNMpAcYNd0rWjXQNrbQrvTG/RJwoN4Y/G0ZVKtQbLfpXD3QovFl7CcymX9/roJGfKdkHu4VfHSdZ5WZbuJwVsBEDwMpELz9uoLYEeYNu/qHPdl11STsKl9F9K7rkkF68k2iJxv+MRsCQQojyzryQHoVFnV3FwGg69gemVKyMExKfpDR0zBfIbw4Ky7m3PeMzg9dTytMCx/fK4iuNvXjiu2tX6jjsVnWcpqLwCj3BiLkA2Lia1rdRYXzofxgp8= joseph@meletao"
          ];
        };
        joseph = {
          isNormalUser = true;
          shell = pkgs.fish;
          hashedPassword = if config.networking.hostName == "kerugma" then
            "$6$F88oWiHPI3YmK5Yv$YQgPl6XhNcy5Byw6dLc7KHu4q/pRituimcnPt7/0Q3RGtblDvVIvsFbFWHmmkfrPNd5wXMc/AvNYKDs26P1hP/"
          else
            "$6$4G0jsFOpNMPy67xF$IMlFKPvMAneGQKTpri7vT6oYMZPql7A0ZAWAIg1VHqVU6ZUYhuhswpRrmXsKesuT8gJ8wUelBWkad8KR0eize0";
          extraGroups = [
            "wheel"
            "mysql"
            "video"
            "dialout"
            "docker"
            "libvirtd"
            "networkmanager"
            "surface-control"
          ];
        };
      };
    };
    # This eliminates the need to type my password for sudo
    security.sudo.extraRules = [{
      users = [ "joseph" ];
      commands = [{
        command = "ALL";
        options = [ "SETENV" "NOPASSWD" ];
      }];
    }];
  };

  kurios = { config, pkgs, ... }: {
    # This profile describes server(s) administrator account
    users.mutableUsers = false;
    users.users.root.hashedPassword =
      "$6$ZkRkSb5ivwvFrWui$GDJeJvApQ7U55cf95gj.WtTUh.0NkGOJL4D5qZmRNZFZ6AfICzaBoqekCZo3KD2bUMrCRRaeeJ51/aQDo6BNQ/";
    users.users.root.openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCuAkGqx5yNT2+ZO7SRGfNVxh+4qb3YhEBsntTAMpdLjrmJTAtgDqdigjXosuAlHVUVjTQeWLQbk1kfRxaI4VA9Nj9uROTY3lhlwNtvhLxYumwRrKZ2j95lY8nAtaDSNHfg8MPMkVHXGi+8imSZEGyKx4p4V65RrOvMTYFP144OFdoIln1AjWuUf2/c4oBS0MESz0gECzexy4//gZv38GDyug0N/7vUkfl5lceIRQjIAtRgxM7qdifoFJCRHCdc1PP7wXfNMpAcYNd0rWjXQNrbQrvTG/RJwoN4Y/G0ZVKtQbLfpXD3QovFl7CcymX9/roJGfKdkHu4VfHSdZ5WZbuJwVsBEDwMpELz9uoLYEeYNu/qHPdl11STsKl9F9K7rkkF68k2iJxv+MRsCQQojyzryQHoVFnV3FwGg69gemVKyMExKfpDR0zBfIbw4Ky7m3PeMzg9dTytMCx/fK4iuNvXjiu2tX6jjsVnWcpqLwCj3BiLkA2Lia1rdRYXzofxgp8= joseph@meletao"
    ];
    users.users.kurios = {
      isNormalUser = true;
      shell = pkgs.fish;
      hashedPassword =
        "$6$BO.9zW.3miRB4vNH$ixlr4ue0MYnaQbtKRzncjOHg25DFbm3MvjfD4GIC4.12HDCRlzh2B/X6zPtoa4ExjOoCQu8oxtCnSv3vjdBid.";
      extraGroups = [ "wheel" "docker" "cloudflared" ];
      packages = with pkgs; [ git wget neovim ];
      openssh.authorizedKeys.keys = [
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCuAkGqx5yNT2+ZO7SRGfNVxh+4qb3YhEBsntTAMpdLjrmJTAtgDqdigjXosuAlHVUVjTQeWLQbk1kfRxaI4VA9Nj9uROTY3lhlwNtvhLxYumwRrKZ2j95lY8nAtaDSNHfg8MPMkVHXGi+8imSZEGyKx4p4V65RrOvMTYFP144OFdoIln1AjWuUf2/c4oBS0MESz0gECzexy4//gZv38GDyug0N/7vUkfl5lceIRQjIAtRgxM7qdifoFJCRHCdc1PP7wXfNMpAcYNd0rWjXQNrbQrvTG/RJwoN4Y/G0ZVKtQbLfpXD3QovFl7CcymX9/roJGfKdkHu4VfHSdZ5WZbuJwVsBEDwMpELz9uoLYEeYNu/qHPdl11STsKl9F9K7rkkF68k2iJxv+MRsCQQojyzryQHoVFnV3FwGg69gemVKyMExKfpDR0zBfIbw4Ky7m3PeMzg9dTytMCx/fK4iuNvXjiu2tX6jjsVnWcpqLwCj3BiLkA2Lia1rdRYXzofxgp8= joseph@meletao"
      ];
    };
  };

  zram = { config, ... }: {
    zramSwap = {
      enable = true;
      priority = 5;
      algorithm = "zstd";
      memoryMax = null;
      numDevices = 1;
      swapDevices = 1;
      memoryPercent = 50;
    };
  };

  zfs = { config, lib, ... }: {
    boot.initrd.postDeviceCommands = lib.mkAfter ''
      zfs rollback -r rpool/local/root@blank
    '';
    services.zfs = {
      autoScrub.enable = true;
      autoSnapshot.enable = true;
    };
  };

  # Sytem Services #

  autorandr = { config, pkgs, ... }: {
    services.autorandr = {
      enable = true;
      #defaultTarget = "mobile";
      #      hooks.postswitch = {
      #        "notify" = "";
      #        "change-background" =
      #          "${pkgs.feh}/bin/feh --randomize --bg-fill /home/${config.user}/.wallpapers/";
      #      };
      profiles = {
        "mobile" = {
          fingerprint = {
            eDP-1-1 =
              "00ffffffffffff004d103b140000000024190104a523137806df50a35435b5260f5054000000010101010101010101010101010101014dd000a0f0703e80302035005ac210000018000000100000000000000000000000000000000000100000000000000000000000000000000000fe004c5131353644314a5730350a200026";
          };
          config = {
            eDP-1-1 = {
              enable = true;
              primary = true;
              position = "0x0";
              mode = "1920x1080";
              rate = "60.00";
              rotate = "normal";
            };
            "DP-3.2".enable = false;
          };
        };
        "docked" = {
          fingerprint = {
            eDP-1-1 =
              "00ffffffffffff004d103b140000000024190104a523137806df50a35435b5260f5054000000010101010101010101010101010101014dd000a0f0703e80302035005ac210000018000000100000000000000000000000000000000000100000000000000000000000000000000000fe004c5131353644314a5730350a200026";
            "DP-3.2" =
              "00ffffffffffff0010ac72f049474c412f19010380301b78ea8ef5a25750a2270c5054a54b00d1c08180a9c0714f0101010101010101023a801871382d40582c4500dc0c1100001e000000ff00364652434835424a414c47490a000000fc0044454c4c53453232313648560a000000fd00384c1e5311000a202020202020015a02031b71230907078301000067030c002000802d43100403e2000f8c0ad08a20e02d10103e9600a05a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000018";
          };
          config = {
            eDP-1-1 = {
              enable = true;
              mode = "1920x1080";
              position = "1080x0";
              primary = true;
              rate = "60.00";
              rotate = "normal";
            };
            "DP-3.2" = {
              enable = true;
              primary = false;
              mode = "1920x1080";
              position = "0x0";
              rotate = "left";
              rate = "60.00";
            };
          };
        };
      };
    };
  };

  cloudflare-tunnel = { config, pkgs, ... }: {
    services.cloudflared = {
      enable = true;
      tunnels = {
        "eaff455f-07fb-4a9a-91ed-a9f893644aff" = {
          credentialsFile =
            "/var/cloudflare/eaff455f-07fb-4a9a-91ed-a9f893644aff.json";
          default = "http_status:404";
          ingress = {
            "git.bitwright.dev" = "http://localhost";
            "*.bitwright.dev" = "http://localhost";
            "*.bitwright.dev/git" = "http://localhost";
          };
        };
      };
    };
  };

  docker = { virtualisation.docker.enable = true; };

  drone-cicd = { config, pkgs, ... }: {
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
        EnvironmentFile = [ # config.sops.secrets.drone.path
        ];
        ExecStart = "${pkgs.drone-runner-exec}/bin/drone-runner-exec";
        User = "drone-runner-exec";
        Group = "drone-runner-exec";
      };
    };

    virtualisation.docker = { enable = true; };
  };

  gitea = { config, pkgs, ... }: {
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
  };

  ddclient = { config, pkgs, ... }: {
    services.ddclient = {
      enable = true;
      ssl = true;
      protocol = "googledomains";
      username = "DdtxLAeSTB0nXnmQ";
      passwordFile = "${pkgs.writeText "password" "dEt4EwV06sJLZ9rO"}";
      ipv6 = false;
      use = "web, web=checkip.dyndns.com/, web-skip='Current IP Address: '";
      interval = "10min";
      domains = [ "bitwright.dev" ];
    };
  };

  gitlab = { config, pkgs, ... }: {
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

  };

  gpg = {
    programs.gnupg.agent = {
      enable = true;
      pinentryFlavor = "gtk2";
      enableSSHSupport = true;
    };
  };

  mysql = { config, pkgs, ... }: {
    services.mysql = {
      enable = true;
      package = pkgs.mysql80;
      group = "mysql";
    };
  };

  ssh = { config, ... }: { services.openssh.enable = true; };

  tailscale = { config, ... }: {
    services.tailscale.enable = true;
    environment.etc = {
      "resolv.conf" = {
        text = ''
          nameserver 100.95.211.76
          nameserver 1.1.1.1
          nameserver 8.8.8.8
        '';
        mode = "644"; # This prevents tailscaled from rewriting resolv.conf
      };
      "test.txt".text = ''
        rgb(${
          inputs.nix-colors.lib-core.conversions.hexToRGBString "," "ABCDEF"
        })

      '';
    };
  };

  touchscreen = { config, ... }: {
    services = {
      touchegg.enable = true;
      unclutter.enable = true;
      unclutter.timeout = 1;
      xserver.libinput = {
        enable = true;
        mouse = {
          tapping = true;
          tappingDragLock = false;
          naturalScrolling = true;
          horizontalScrolling = false;
        };
        touchpad = {
          tapping = true;
          tappingDragLock = true;
          naturalScrolling = true;
          horizontalScrolling = true;
          disableWhileTyping = true;
        };
      };
    };
  };

  thinkpad-dock = { config, pkgs, ... }: {
    services.udev = {
      enable = true;
      extraRules = ''
        SUBSYSTEM=="usb", ACTION=="add", ATTRS{idProduct}=="1010", ATTRS{idVendor}=="17ef", ATTRS{bcdDevice}=="5040", RUN+="${pkgs.autorandr} --force -l docked"
        SUBSYSTEM=="usb", ACTION=="remove", ATTRS{idProduct}=="1010", ATTRS{idVendor}=="17ef", ATTRS{bcdDevice}=="5040", RUN+="${pkgs.autorandr} --force -l mobile"
      '';
    };
  };

  # System(s) Secrets
  # agenix, sops, ragenix confs go here
  secrets = { age.secrets.test.file = ./secrets/test.age; };

  #Custom Modules
  hello = import ./homeModules/brood.nix;
}
