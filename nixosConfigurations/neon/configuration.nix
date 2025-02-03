{ inputs, config, lib, pkgs, ... }: {
  boot = {
    loader.efi.canTouchEfiVariables = true;
    loader.grub = {
      enable = true;
      efiSupport = true;
    };
  };

  networking = {
    hostName = "neon";
    hostId = "e56b917a";
    firewall.enable = false;
  };

  system.stateVersion = "24.11";
}
