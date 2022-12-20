{
  meletao = {
    networking.hostName = "meletao";
    deployment = {
      allowLocalDeployment = true;
      targetHost = null;
    };
    imports = [ cell.nixosConfigurations.meletao ];
  };
}
