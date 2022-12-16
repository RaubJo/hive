{ config, pkgs, ... }: {
  networking = {
    #    useDHCP = false;
    wireless = {
      enable = true;
      userControlled.enable = true;
      userControlled.group = "wheel";
      networks = {
        FTCNWKS = {
          #psk = "FlesS117";
          pskRaw =
            "67465f1716ee60c76d89a05c3b1015e87889961064aa13c6299a0b3e465723ae";
        };
        Phone = {
          #psk = "josephraub";
          pskRaw =
            "4206780088dbc2528e3c8426ab9dfd7c6e7b0d3c6ec161897a975633ae04bc43";
        };
        NHBC = {
          #psk = "LfeHQgQXm4fwk3H92q69mdGRAnVBB2FQ9yMJrsLm";
          pskRaw =
            "b0695d90f6630f9618ffcfde2fa33b7f72316fc41ac156d4c9020d3727097089";
        };
        #NETGEAR09 = {
        #psk = "2nhbcapt";
        # pskRaw = "2ef892d3c4497bd656eee36468170fb5f1ffc707bfffc5ca0676ab51992dbeca";
        #};
        NETGEAR09-5G = { psk = "2nhbcapt"; };
        RAUB = {
          #psk = "g1sg00D@T";
          pskRaw =
            "cc589f9341298c99e1e302987fb6051adfa5f16a7ceb253faac3fe467d3b8e15";
        };
        Raub = {

          #psk = "7857261003";
          pskRaw =
            "30152cb984de3fafec99ab6a8db9479671cc7d97a83951a24eaea60b8b0ffca4";
        };
        Hearn = {
          #psk = "Hearnhouse";
          pskRaw =
            "0427cc1ce2482b8a3fed13991403e27579492c343766be76cdbed0a723b3bbf4";
        };
        SpectrumSetup-64 = {
          #psk = "markettown240";
          pskRaw =
            "3137ea7591b8948c72cc14f09662d8e07d4332f3ae6a3df8466b1cc8dc3947e9";
        };
        "Southland Public" = {
          #psk = "southland1993";
          pskRaw =
            "2fcafd19719819c614aca984b379f0cd2887f177b0bb1c5aa1b67423c5b28e74";
        };
        Here = {
          #psk = "0Athai1andZ1";
          pskRaw =
            "308393ef5547f39cc27d13e888939162ada177d75a6518acbaa2ba79a3ec55eb";
        };
        "4_Chips" = {
          #psk = "And4salsa";
          pskRaw =
            "9436e7d312766b7545f863b95c821cc5e66d2f2f295e152928d22122399c788b";
        };
      };
    };
  };
}

