{ inputs, cell }:
let
  inherit (inputs) nixpkgs std;
  inherit (std.lib) dev;
  l = nixpkgs.lib // builtins;
in
l.mapAttrs (_: dev.mkShell) {
  default = { ... }: {
    name = "Hive DevShell";
    imports = [ ];
    packages = with nixpkgs; [ nixpkgs-fmt nix-du graphviz bat ];
    commands = [
      {
        name = "check";
        command = "nix flake check";
        help = "Check the flake";
        category = "Testing";
      }
      {
        name = "show";
        command = "nix flake show";
        help = "Show flake inputs";
        category = "Testing";
      }
      {
        name = "nepl";
        command = "nix repl --expr 'builtins.getFlake (toString ./.)'";
        help = "Enter the nix repl";
        category = "Testing";
      }
      {
        name = "todo";
        command = "rg '#TODO:' * ";
        help = " Lists all todos in project";
        category = "Development";
      }
      {
        name = "format";
        command = "nixpkgs-fmt *";
        help = "Formats the project with nixpkgs-fmt";
        category = "Formatting";
      }
      {
        package = nixpkgs.deadnix;
        help = "Find dead code";
        category = "Formatting";
      }
      {
        package = nixpkgs.statix;
        help = "Linter";
        category = "Formatting";
      }
      {
        name = "du";
        command = "nix-du";
        help = "See disk usage of nix store on system";
        category = "Helps";
      }
      {
        name = "du-svg";
        command = "nix-du | dot -Tsvg > du.svg";
        help = "Create svg graph of nix store with nix-du";
        category = "Helps";
      }
      {
        name = "cls";
        command = "clear";
        help = "Alias for clear";
        category = "general commands";
      }
    ];
  };
}
