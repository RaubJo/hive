{ inputs, cell, }:
let
  inherit (inputs.cells) modules agenix;
in
{
  imports = [ ] ++ modules.nixosSuites.git-server ++ agenix.nixosSuites.gitea;
  config.servers.git = {
    enable = true;
    # This must be set in the system config
    #databasePasswordFile = config.age.secrets.gitea-dbpass.path;
  };
}
