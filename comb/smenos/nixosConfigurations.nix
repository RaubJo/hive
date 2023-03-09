 { inputs, cell, }:
 {
   meletao = import ./nixosConfigurations/meletao { inherit inputs cell; };
   nephos = import ./nixosConfigurations/nephos { inherit inputs cell; };
   kouphizo = import ./nixosConfigurations/kouphizo { inherit inputs cell; };
   thureos = import ./nixosConfigurations/thureos { inherit inputs cell; };
   kerugma = import ./nixosConfigurations/kerugma { inherit inputs cell; };
   tamieion = import ./nixosConfigurations/tamieion { inherit inputs cell; };
 }
