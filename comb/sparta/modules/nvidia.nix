{ pkgs, ... }:

let
  nvidia-offload = pkgs.writeShellScriptBin "nvidia-offload" ''
    export __NV_PRIME_RENDER_OFFLOAD=1
    export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export __VK_LAYER_NV_optimus=NVIDIA_only
    exec -a "$0" "$@"
  '';
in
{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = [ nvidia-offload ];
  # services.videoDrivers = [ "modesetting" "nvidia" ];
  services.xserver.videoDrivers = [ "nvidia" ];
  # services.xserver.videoDrivers = [ "nvidiaBeta" ];
  # services.xserver.videoDrivers = [ "modesetting" "nouveau" ];


  hardware.nvidia = {
    # modesetting.enable = true;
    # prime.offload.enable = true;
    prime.sync.enable = true;

    prime = {
      # Bus ID of the Intel GPU. You can find it using lspci, either under 3D or VGA
      intelBusId = "PCI:0:2:0";
      # Bus ID of the NVIDIA GPU. You can find it using lspci, either under 3D or VGA
      nvidiaBusId = "PCI:1:0:0";
    };
  };
}
