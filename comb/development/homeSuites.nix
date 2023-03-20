let
  inherit (cell) homeModules;
in
{
  default = with homeModules; [
    nix
    tooling
    bash
  ];

  web = with homeModules; [
    web
    docker
  ];

  rust = with homeModules; [
    rust
  ];

  cpp = with homeModules; [
    cpp
  ];

  # 3D Printing
  printing = with homeModules; [
    printing
  ];

  experimental = with homeModules; [
    elm
    haskell
  ];

  all = with homeModules; [ nix tooling bash web docker rust cpp printing elm haskell ];
}
