{
  meletao = { config, pkgs, lib, ... }: {
    bee.system = "x86_64-linux";
    bee.pkgs = import inputs.nixos {
      inherit (inputs.nixpkgs) system;
      config.allowUnfree = true;
      overlays = [ ];
    };
    imports = [ cell.nixosSuites.base ];
  };
}
