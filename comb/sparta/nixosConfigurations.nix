{
  meletao = { config, pkgs, lib, ... }: {
    bee.system = "x86_64-linux";
    bee.pkgs = import inputs.nixos {
      inherit (inputs.nixpkgs) system;
      config.allowUnfree = true;
      overlays = [ ];
    };
    imports = [ cell.nixosSuites.base cell.nixosSuites.laptop ];
  };
  nephos = { config, pkgs, lib, ... }: {
    bee.system = "x86_64-linux";
    bee.pkgs = import inputs.nixos {
      inherit (inputs.nixpkgs) system;
      config.allowUnfree = true;
      overlays = [ ];
    };
    imports = [ cell.nixosSuites.base cell.nixosSuites.server ];
  };
  kouphizo = { config, pkgs, lib, ... }: {
    bee.system = "aarch64-linux";
    bee.pkgs = import inputs.nixos {
      inherit (inputs.nixpkgs) system;
      config.allowUnfree = true;
      overlays = [ ];
    };
    imports = [
      cell.nixosSuites.base
      #cell.nixosSuites.
    ];
  };
  thureos = { config, pkgs, lib, ... }: {
    bee.system = "armv7-linux";
    imports = [ cell.nixosSuites.base ];
  };
  kerugma = { config, pkgs, lib, ... }: {
    bee.system = "x86_64-linux";
    bee.pkgs = import inputs.nixos {
      inherit (inputs.nixpkgs) system;
      config.allowUnfree = true;
      overlays = [ ];
    };
    imports = [ cell.nixosSuites.base cell.nixosSuites.mobile ];
  };

}
