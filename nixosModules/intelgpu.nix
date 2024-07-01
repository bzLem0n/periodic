{ config, pkgs, lib, ... }: {
  boot.initrd.availableKernelModules = [ "i915" ];

  hardware = {
    graphics = {
      extraPackages = with pkgs; [
        intel-media-driver
        vaapiIntel
        vaapiVdpau
        libvdpau-va-gl
      ];

      extraPackages32 = with pkgs; [
        driversi686Linux.intel-media-driver
        driversi686Linux.libva-vdpau-driver
        driversi686Linux.libvdpau-va-gl
      ];
    };
  };
}
