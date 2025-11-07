{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
{
  networking = {
    hostName = "krypton";
    hostId = "158b2654";
    firewall.enable = false;
    bridges.br0.interfaces = [ "enp1s0" ];
    interfaces.br0.useDHCP = true;
    interfaces.br0.macAddress = "00:4e:01:be:96:7a";
    useDHCP = false;
  };

  systemd.sleep.extraConfig = ''
    AllowSuspend=no
    AllowHibernation=no
    AllowHybridSleep=no
    AllowSuspendThenHibernate=no
  '';

  services.zfs = {
    autoScrub.enable = true;
    trim.enable = true;
  };

  system.stateVersion = "23.11";
}
