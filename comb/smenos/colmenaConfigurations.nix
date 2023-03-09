{
  meletao = { ... }: {
    networking.hostName = "meletao";
    deployment = {
      allowLocalDeployment = true;
      targetHost = null;
      #keys = { test_password = { keyFile = ./secrets/test_password.txt; }; };
    };
    imports = [ cell.nixosConfigurations.meletao ];
  };

  nephos = {
    networking.hostName = "nephos";
    deployment = {
      tags = [ "server" ];
      targetHost = "100.74.102.53";
      targetPort = 22;
      targetUser = "root";
      #privilegeEscalationCommand = [ "sudo" ];
      buildOnTarget = false;
      allowLocalDeployment = false;
      keys = {
        # ddclient-user.keyFile = ./secrets/ddclient
      };
    };
    imports = [ cell.nixosConfigurations.nephos ];
  };

  tamieion = {
    networking.hostName = "tamieion";
    deployment = {
      tags = [ "server" ];
      targetHost = "100.67.46.42";
      targetPort = 22;
      targetUser = "root";
      buildOnTarget = false;
      allowLocalDeployment = false;
    };
    imports = [ cell.nixosConfigurations.tamieion ];
  };

  kouphizo = {
    networking.hostName = "kouphizo";
    deployment = {
      allowLocalDeployment = true;
      targetHost = "192.168.1.111";
    };
    imports = [ cell.nixosConfigurations.kouphizo ];
  };

  kerugma = {
    networking.hostName = "kerugma";
    deployment = {
      targetHost = "100.115.221.114";
      targetUser = "root";
      targetPort = 22;
      buildOnTarget = false;
      allowLocalDeployment = true;
    };
    imports = [ cell.nixosConfigurations.kerugma ];
  };
}
