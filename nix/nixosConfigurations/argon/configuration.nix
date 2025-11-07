{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
{
  networking = {
    hostName = "argon";
    hostId = "0a778488";
    firewall.enable = false;
  };

  system.stateVersion = "23.11";
}
