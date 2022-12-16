{

  age = {
    identityPaths = [
    "/home/joseph/nixos/secrets/joseph.txt"
    ];
    secretsMountPoint = "/state/run/secret-generations";
    secrets = {
      userPassword.file = ../secrets/userPassword.age;
      rootPassword.file = ../secrets/rootPassword.age;

    };
  };
}
