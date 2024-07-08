{ config, pkgs, lib, ... }: {
  boot.initrd.availableKernelModules = [ "i915" ];

  environment.variables = {
    VDPAU_DRIVER = "va_gl";
  };

  hardware = {
    graphics = {
      extraPackages = with pkgs; [
        intel-media-driver
        intel-vaapi-driver
      ];

      extraPackages32 = with pkgs.driversi686Linux; [
        intel-media-driver
        intel-vaapi-driver
      ];
    };
  };
}
