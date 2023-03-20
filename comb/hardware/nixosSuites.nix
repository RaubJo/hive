{ inputs, cell }:
let inherit (cell) nixosModules;
in
{
  default = with nixosModules; [ default ];

  intel = with nixosModules; [ intel sgx ];

  nvidia = with nixosModules; [ nvidia ];

  lenovo-p50 = with nixosModules; [
    bluetooth
    audio
    hidpi
    p50-screen
    p50-dock
  ];

}
