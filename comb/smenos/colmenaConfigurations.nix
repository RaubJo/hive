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
      allowLocalDeployment = true;
      targetHost = "100.74.102.53";
    };
    imports = [ cell.nixosConfigurations.nephos ];
  };

  # kouphizo = {
  #   networking.hostName = "kouphizo";
  #   deployment = {
  #     allowLocalDeployment = true;
  #     targetHost = "100.94.127.111";
  #   };
  #   imports = [ cell.nixosConfigurations.kouphizo ];
  # };

  kerugma = {
    networking.hostName = "kerugma";
    deployment = {
      allowLocalDeployment = true;
      targetHost = "100.115.221.114";
    };
    imports = [ cell.nixosConfigurations.kerugma ];
  };
}
