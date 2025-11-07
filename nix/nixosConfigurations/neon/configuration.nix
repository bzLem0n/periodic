{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
{
  networking = {
    hostName = "neon";
    hostId = "e56b917a";
    firewall.enable = false;
  };

  system.stateVersion = "24.11";
}
