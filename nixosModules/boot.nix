{ config, pkgs, lib, ... }: {
  boot = {
    blacklistedKernelModules = [ "snd_pcsp" ]; 
    initrd.systemd.enable = true;
  };
}
