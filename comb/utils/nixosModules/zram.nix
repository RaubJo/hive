{ config, ... }: {
  zramSwap = {
    enable = true;
    priority = 5;
    algorithm = "zstd";
    memoryMax = null;
    numDevices = 1;
    swapDevices = 1;
    memoryPercent = 50;
  };
}
