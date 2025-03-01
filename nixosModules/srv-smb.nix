{ config, pkgs, lib, ... }: {
  services.samba = {
    enable = true;
    openFirewall = true;
    settings = {
      global = {
        "workgroup" = "PERIODIC";
        "server string" = "Samba Server";
        "netbios name" = "xenon";
        "security" = "user";
        "hosts allow" = "192.168.1. 127.0.0.1 localhost";
        "hosts deny" = "0.0.0.0/0";
        "guest account" = "nobody";
        "map to guest" = "bad user";
      };
      "library" = {
        "path" = "/srv/library";
        "browseable" = "yes";
        "read only" = "yes";
        "guest ok" = "yes";
        "write list" = "kcrook";
        "create mask" = "0644";
        "directory mask" = "0755";
      };
      "backup" = {
        "path" = "/srv/backup";
        "browseable" = "yes";
        "read only" = "no";
        "guest ok" = "no";
        "create mask" = "0600";
        "directory mask" = "0700";
      };
    };
  };

  services.samba-wsdd = {
    enable = true;
    openFirewall = true;
  };

  services.avahi = {
    publish.enable = true;
    publish.userServices = true;
    nssmdns4 = true;
    enable = true;
    openFirewall = true;
  };

  networking.firewall.allowPing = true;
}
