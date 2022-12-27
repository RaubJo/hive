{
  meletao = {
    networking.hostName = "meletao";
    deployment = {
      allowLocalDeployment = true;
      targetHost = null;
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
    };
    imports = [ cell.nixosConfigurations.nephos ];
  };

  # tamieion = {
  #   networking.hostName = "tamieion";
  #   deployment = {
  #     tags = [ "server" ];
  #     targetHost = "";
  #     targetPort = 22;
  #     targetUser = "root";
  #     buildOnTarget = false;
  #     allowLocalDeployment = false;
  #   };
  #   imports = [ cell.nixosConfigurations.tamieion ];
  # };

  kouphizo = {
    networking.hostName = "kouphizo";
    deployment = {
      allowLocalDeployment = true;
      targetHost = "100.94.127.111";
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
