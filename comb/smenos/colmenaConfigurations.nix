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
      targetHost = "100.74.102.53";
      targetPort = 22;
      targetUser = "joseph";
      buildOnTarget = false;
      allowLocalDeployment = false;
    };
    imports = [ cell.nixosConfigurations.nephos ];
  };

  kouphizo = {
    networking.hostName = "kouphizo";
    deployment = {
      allowLocalDeployment = true;
      targetHost = "100.94.127.111";
    };
    imports = [ cell.nixosConfigurations.kouphizo ];
  };

  #   kerugma = {
  #     networking.hostName = "kerugma";
  #     deployment = {
  #       allowLocalDeployment = true;
  #       targetHost = "100.115.221.114";
  #     };
  #     imports = [ cell.nixosConfigurations.kerugma ];
  #   };
}
