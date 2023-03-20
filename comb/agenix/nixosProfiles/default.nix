{ inputs, cell }:
let
  inherit (inputs);
in
{
  imports = [ inputs.agenix.nixosModules.default ];
}
