{
  inputs,
  config,
  pkgs,
  lib,
  ...
}: {
  boot = {
    loader.efi.canTouchEfiVariables = lib.mkDefault true;
    loader.limine = {
      enable = true;
      efiSupport = true;
      efiInstallAsRemovable = true;
    };
  };
}
