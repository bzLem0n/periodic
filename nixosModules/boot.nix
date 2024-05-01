{ config, pkgs, lib, ... }: {
  boot = {
    blacklistedKernelModules = [ "snd_pcsp" ];
  };
}
