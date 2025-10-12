{
  inputs,
  config,
  pkgs,
  lib,
  ...
}:
{
  imports = [
    inputs.self.nixosModules.bootsplash
  ];

  boot = {
    blacklistedKernelModules = [ "snd_pcsp" ];
    initrd.systemd.enable = true;
  };
}
