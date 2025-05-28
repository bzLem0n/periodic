{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
{
  boot = {
    loader.efi.canTouchEfiVariables = true;
    loader.grub = {
      enable = true;
      efiSupport = true;
    };
  };

  networking = {
    hostName = "argon";
    hostId = "0a778488";
    firewall.enable = false;
  };

  system.stateVersion = "23.11";
}
