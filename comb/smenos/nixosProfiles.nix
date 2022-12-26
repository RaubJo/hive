let

  inherit (inputs) nixpkgs;
  #inherit (cell) customScripts;
  lib = nixpkgs.lib // builtins;
in {
  # Networking #
  firewall = { config, ... }: {
    networking.firewall = {
      enable = true;
      checkReversePath = "loose";
      allowedTCPPorts = [ 22 80 ];
      allowedUDPPorts = [ 53 80 ];
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
          FTCNWKS = {
            #psk = "FlesS117";
            pskRaw =
              "67465f1716ee60c76d89a05c3b1015e87889961064aa13c6299a0b3e465723ae";
          };
          Phone = {
            #psk = "josephraub";
            pskRaw =
              "4206780088dbc2528e3c8426ab9dfd7c6e7b0d3c6ec161897a975633ae04bc43";
          };
          NHBC = {
            #psk = "LfeHQgQXm4fwk3H92q69mdGRAnVBB2FQ9yMJrsLm";
            pskRaw =
              "b0695d90f6630f9618ffcfde2fa33b7f72316fc41ac156d4c9020d3727097089";
          };
          NETGEAR09 = {
            #psk = "2nhbcapt";
            pskRaw =
              "2ef892d3c4497bd656eee36468170fb5f1ffc707bfffc5ca0676ab51992dbeca";
          };
          NETGEAR09-5G = {
            #psk = "2nhbcapt";
            pskRaw =
              "9b7e5b1cd33d135285b45c174b521e1232b884f8960599f06654865d4f03c8fb";
            priority = 5;
          };
          RAUB = {
            #psk = "g1sg00D@T";
            pskRaw =
              "cc589f9341298c99e1e302987fb6051adfa5f16a7ceb253faac3fe467d3b8e15";
          };
          Raub = {
            #psk = "7857261003";
            pskRaw =
              "30152cb984de3fafec99ab6a8db9479671cc7d97a83951a24eaea60b8b0ffca4";
          };
          Hearn = {
            #psk = "Hearnhouse";
            pskRaw =
              "0427cc1ce2482b8a3fed13991403e27579492c343766be76cdbed0a723b3bbf4";
          };
          SpectrumSetup-64 = {
            #psk = "markettown240";
            pskRaw =
              "3137ea7591b8948c72cc14f09662d8e07d4332f3ae6a3df8466b1cc8dc3947e9";
          };
          "Southland Public" = {
            #psk = "southland1993";
            pskRaw =
              "2fcafd19719819c614aca984b379f0cd2887f177b0bb1c5aa1b67423c5b28e74";
          };
          Here = {
            #psk = "0Athai1andZ1";
            pskRaw =
              "308393ef5547f39cc27d13e888939162ada177d75a6518acbaa2ba79a3ec55eb";
          };
          "4_Chips" = {
            #psk = "And4salsa";
            pskRaw =
              "9436e7d312766b7545f863b95c821cc5e66d2f2f295e152928d22122399c788b";
          };
        };
      };
    };
  };

  nm-networks = { config, ... }: {
    networking = {
      wireless.enable = false;
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

  xmonad = { config, ... }: {
    imports = [ ./xmo-scripts.nix ];
    services.xserver = {
      enable = true;
      layout = "us";
      libinput.enable = true;
      displayManager = {
        lightdm.enable = true;
        defaultSession = "myXSession";
        session = [{
          manage = "desktop";
          name = "myXSession";
          start = "exec $HOME/.xsession";
        }];
      };
    };
  };

  ### Web Services ###
  gitea = { config, ... }: {
    services.gitea = {
      enable = true;
      httpAddress = "0.0.0.0";
      httpPort = 8001;
    };
  };

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
      fonts = with pkgs; [ noto-fonts liberation_ttf dejavu_fonts nerdfonts ];
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

  plymouth = { config, ... }: { boot.plymouth = { enable = true; }; };

  users = { config, ... }: {
    users = {
      mutableUsers = false;
      users = {
        root = {
          hashedPassword =
            "$6$tNyYLYGxyzydAdhD$0EmLRGrPupIGpD4pJPZrDkZdpZ6OVEVgGv2lTiebKAlzXZbRi3kWbfQwCjXQbZfWBz7/lv8wr7IB0JpZu4uUu1";
        };
        joseph = {
          isNormalUser = true;
          hashedPassword = if config.networking.hostName == "kerugma" then
            "$6$F88oWiHPI3YmK5Yv$YQgPl6XhNcy5Byw6dLc7KHu4q/pRituimcnPt7/0Q3RGtblDvVIvsFbFWHmmkfrPNd5wXMc/AvNYKDs26P1hP/"
          else
            "$6$4G0jsFOpNMPy67xF$IMlFKPvMAneGQKTpri7vT6oYMZPql7A0ZAWAIg1VHqVU6ZUYhuhswpRrmXsKesuT8gJ8wUelBWkad8KR0eize0";
          extraGroups = [
            "wheel"
            "video"
            "dialout"
            "libvirtd"
            "networkmanager"
            "surface-control"
          ];
        };
      };
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
  ssh = { config, ... }: { services.openssh.enable = true; };

  tailscale = { config, ... }: {
    services.tailscale.enable = true;
    # nameserver 192.168.1.5
    environment.etc = {
      "resolv.conf" = {
        text = ''
          nameserver 100.95.211.76
          nameserver 1.1.1.1
          nameserver 8.8.8.8
        '';
        mode = "644"; # This prevents tailscaled from rewriting resolv.conf
      };
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

  # System(s) Secrets
  # agenix, sops, ragenix confs go here
}
