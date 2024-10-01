{ config, pkgs, lib, ... }: {
  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    virtualHosts = {
      # ... existing hosts config etc. ...
      "lem0n.zapto.org" = {
        locations."/".proxyPass =
          "http://${config.services.nix-serve.bindAddress}:${
            toString config.services.nix-serve.port
          }";
      };
    };
  };

  services.nix-serve = {
    enable = true;
    secretKeyFile = "/var/cache-priv-key.pem";
  };
}
