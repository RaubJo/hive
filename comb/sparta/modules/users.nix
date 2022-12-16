{ config, lib, pkgs, ... }:

{
  users = {
    users = {
      root = {
        isNormalUser = true;
        hashedPassword =
          "$y$j9T$gwPQE/esRkWaofglMQ4NU.$DxnJzuA.qx5Co2EgNhys/Uks/HqZ3h5awkVMqs.K4E5";
      };

      joseph = {
        isNormalUser = true;
        extraGroups = [ "wheel" "video" "dialout" "libvirtd" ];
        hashedPassword =
          "$y$j9T$gwPQE/esRkWaofglMQ4NU.$DxnJzuA.qx5Co2EgNhys/Uks/HqZ3h5awkVMqs.K4E5";
      };

    };
  };
}
