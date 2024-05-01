{ config, pkgs, lib, ... }: {
  boot.initrd.availableKernelModules = [ "i915" ];

  hardware = {
    opengl = {
      extraPackages = [
        pkgs.intel-media-driver
        pkgs.vaapiIntel
        pkgs.vaapiVdpau
        pkgs.libvdpau-va-gl
      ];

      extraPackages32 = [
        pkgs.driversi686Linux.intel-media-driver
        pkgs.driversi686Linux.vaapiVdpau
        pkgs.driversi686Linux.libvdpau-va-gl
      ];
    };
  };
}
