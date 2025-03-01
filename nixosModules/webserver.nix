{ config, pkgs, lib, ... }: {
  security.acme = {
    acceptTerms = true;
    defaults.email = "kevinwaynecrook@gmail.com";
  };

  services.nginx = {
    enable = true;
    recommendedTlsSettings = true;
    virtualHosts."lem0n.zapto.org" = {
      enableACME = true;
      forceSSL = true;
      locations = {
        "/" = {
          root = "/srv/http";
        };
        "/homeassistant" = {
          proxyPass = "http://192.168.1.219:8123";
          proxyWebsockets = true;
          recommendedProxySettings = true;
        };
      };
    };
  };
}
