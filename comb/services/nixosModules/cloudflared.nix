{ ... }: {
  services.cloudflared = {
    enable = true;
    tunnels = {
      "eaff455f-07fb-4a9a-91ed-a9f893644aff" = {
        credentialsFile =
          "/var/cloudflare/eaff455f-07fb-4a9a-91ed-a9f893644aff.json";
        default = "http_status:404";
        ingress = {
          "git.bitwright.dev" = "http://localhost";
          "*.bitwright.dev" = "http://localhost";
          "*.bitwright.dev/git" = "http://localhost";
        };
      };
    };
  };
}
