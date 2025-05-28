{
  config,
  pkgs,
  lib,
  ...
}:
{
  services.harmonia.enable = true;
  services.harmonia.signKeyPaths = [ "/var/lib/secrets/harmonia.secret" ];

  networking.firewall.allowedTCPPorts = [
    443
    80
  ];

  services.nginx = {
    enable = true;
    virtualHosts."192.168.1.36" = {
      locations."/".extraConfig = ''
        proxy_pass http://127.0.0.1:5000;
        proxy_set_header Host $host;
        proxy_redirect http:// https://;
        proxy_http_version 1.1;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection $connection_upgrade;
      '';
    };
  };
}
