{
  config,
  pkgs,
  lib,
  ...
}:
{
  boot.initrd.availableKernelModules = [ "amdgpu" ];

  hardware.graphics = {
    extraPackages = [ pkgs.amdvlk ];
    extraPackages32 = [ pkgs.driversi686Linux.amdvlk ];
  };
}
