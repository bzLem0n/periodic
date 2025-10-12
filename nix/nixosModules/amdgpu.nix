{
  config,
  pkgs,
  lib,
  ...
}:
{
  boot.initrd.availableKernelModules = [ "amdgpu" ];
}
