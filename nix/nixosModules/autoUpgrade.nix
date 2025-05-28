{
  config,
  pkgs,
  lib,
  ...
}:
{
  system.autoUpgrade = {
    enable = true;
    flake = "github:bzLem0n/periodic#${config.networking.hostName}";
    dates = "02:30";
    randomizedDelaySec = "5min";
    persistent = true;
    allowReboot = true;
    rebootWindow = {
      lower = "02:30";
      upper = "05:30";
    };
  };

  nix.gc = {
    automatic = true;
    persistent = false;
    dates = "06:00";
    options = "--delete-older-than 10d";
  };
}
