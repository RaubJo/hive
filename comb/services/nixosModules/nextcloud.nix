{ config, pkgs, ... }: {
  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud25;
    hostName = "localhost";
    config.adminpassFile = "${pkgs.writeText "adminpass" "123456"}";
    #config.extraTrustedDomains = [];
    # This value should be set in the system specific config because of unique ip addresses
    appstoreEnable = true;
    enableImagemagick = true;
  };
  # The nextcloud module, unless specified, uses nginx to serve the site.
  # Add ACME?
}
