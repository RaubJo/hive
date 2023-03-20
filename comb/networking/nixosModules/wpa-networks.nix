{ config, ... }: {
  networking = {
    networkmanager.enable = false;
    wireless = {
      enable = true;
      userControlled.enable = true;
      userControlled.group = "wheel";
      networks = {
        "dalabarge-5G2" = {
          pskRaw =
            "ddcf0e213f4bb0f4cb1a125fa0509f1520eebe4bb06a3a976d8ef97e7abe76c0";
        };
        "WRT300N-DD" = {
          pskRaw =
            "01615c3307d6bc6c8ba8113df877604fc5bfc4bf5c79e9580420e1f9d8fa43c8";
        };
        FTCNWKS = {
          pskRaw =
            "67465f1716ee60c76d89a05c3b1015e87889961064aa13c6299a0b3e465723ae";
        };
        Phone = {
          pskRaw =
            "4206780088dbc2528e3c8426ab9dfd7c6e7b0d3c6ec161897a975633ae04bc43";
          priority = 5;
        };
        NHBC = {
          pskRaw =
            "b0695d90f6630f9618ffcfde2fa33b7f72316fc41ac156d4c9020d3727097089";
          priority = 4;
        };
        NETGEAR09 = {
          pskRaw =
            "2ef892d3c4497bd656eee36468170fb5f1ffc707bfffc5ca0676ab51992dbeca";
        };
        NETGEAR09-5G = {
          pskRaw =
            "9b7e5b1cd33d135285b45c174b521e1232b884f8960599f06654865d4f03c8fb";
          priority = 4;
        };
        RAUB = {
          pskRaw =
            "cc589f9341298c99e1e302987fb6051adfa5f16a7ceb253faac3fe467d3b8e15";
        };
        Raub = {
          pskRaw =
            "30152cb984de3fafec99ab6a8db9479671cc7d97a83951a24eaea60b8b0ffca4";
        };
        Hearn = {
          pskRaw =
            "0427cc1ce2482b8a3fed13991403e27579492c343766be76cdbed0a723b3bbf4";
        };
        SpectrumSetup-64 = {
          pskRaw =
            "3137ea7591b8948c72cc14f09662d8e07d4332f3ae6a3df8466b1cc8dc3947e9";
        };
        "Southland Public" = {
          pskRaw =
            "2fcafd19719819c614aca984b379f0cd2887f177b0bb1c5aa1b67423c5b28e74";
        };
        Here = {
          pskRaw =
            "308393ef5547f39cc27d13e888939162ada177d75a6518acbaa2ba79a3ec55eb";
        };
        "4_Chips" = {
          pskRaw =
            "9436e7d312766b7545f863b95c821cc5e66d2f2f295e152928d22122399c788b";
        };
      };
    };
  };
}
