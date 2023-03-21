let
  inherit (inputs.cells) agenix applications emacs filesystems firmware gui hardware modules networking security services terminal users utils;
in
rec
{
  #TODO: Port other systems
  base = [ ]
    #++ applications.nixosSuites.packages
    ++ filesystems.nixosSuites.default
    ++ security.nixosSuites.default
    ++ firmware.nixosSuites.default
    ++ hardware.nixosSuites.default
    #++ networking.nixosSuites.default
    ++ services.nixosSuites.default
    ++ utils.nixosSuites.default;

  lenovo-p50 = [ ]
    ++ base
    ++ applications.nixosSuites.default
    ++ services.nixosSuites.lenovo-p50
    ++ hardware.nixosSuites.lenovo-p50
    ++ hardware.nixosSuites.intel
    ++ hardware.nixosSuites.nvidia
    ++ services.nixosSuites.lenovo-p50
    ++ services.nixosSuites.web-dev
    ++ gui.nixosSuites.xmonad
    #++ agenix.nixosSuites.wpa-networks
    ++ networking.nixosSuites.default
    #++ services.nixosSuites.gitea-server
    ++ users.nixosSuites.default;

  gitea-server = [ ]
    #++ services.nixosSuites.gitea
    ++ modules.nixosSuites.git-server
    #++ secrets.nixosSuites.gitea
    ++ users.nixosSuites.kurios;

  gitlab-server = [ ]
    #++ services.nixosSuites.gitlab
    ++ users.nixosSuites.kurios;

  tablet = [ ]
    ++ networking.nixosSuites.nm-networks
    ++ gui.nixosSuites.gnome
    ++ services.nixosSuites.tablet
    ++ utils.nixosSuites.light
    ++ users.nixosSuites.tablet;

  nextcloud = [ ]
    ++ services.nixosSuites.nextcloud
    ++ users.nixosSuites.kurios;

}
