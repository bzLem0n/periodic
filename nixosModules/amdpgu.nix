{ config, pkgs, lib, ... }: {
  boot.initrd.availableKernelModules = [ "amdgpu" ];

  hardware = {
    opengl = {
      extraPackages = [ pkgs.amdvlk ];
      extraPackages32 = [ pkgs.driversi686Linux.amdvlk ];
    };
  };
}
