{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}:

{
  boot.initrd.availableKernelModules = [
    "ahci"
    "xhci_pci"
    "usb_storage"
    "uas"
    "sr_mod"
    "sd_mod"
    "sdhci_acpi"
    "rtsx_usb_sdmmc"
    "virtio_pci"
    "virtio_scsi"
  ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
