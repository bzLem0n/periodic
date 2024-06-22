{ config, pkgs, lib, ... }: {
  networking = {
    domain = "lem0n.zapto.org";
    timeServers = [ "timelord.uregina.ca" ];

    hosts = {
      "192.168.1.18" = [ "argon" "argon.lem0n.zapto.org" ];
      "192.168.1.21" = [ "scandium" "scandium.lem0n.zapto.org" ];
      "192.168.1.30" = [ "zinc" "zinc.lem0n.zapto.org" ];
      "192.168.1.36" = [ "krypton" "krypton.lem0n.zapto.org" ];
      "192.168.1.46" = [ "palladium" "palladium.lem0n.zapto.org" ];
      "192.168.1.47" = [ "silver" "silver.lem0n.zapto.org" ];
      "192.168.1.54" = [ "xenon" "xenon.lem0n.zapto.org" ];
      "192.168.1.220" = [ "avr" "avr.lem0n.zapto.org" ];
      "192.168.1.221" = [ "nest" "nest.lem0n.zapto.org" ];
      "192.168.1.222" = [ "hue" "hue.lem0n.zapto.org" ];
      "192.168.1.223" = [ "legrand" "legrand.lem0n.zapto.org" ];
    };
  };

  services = {
    ntp.enable = true;
    openssh.enable = true;
  };
}
