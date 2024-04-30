{ config, pkgs, lib, ... }: {
  boot = {
    blacklistedKernelModules = [ "snd_pcsp" ];

    kernelParams = [
      "quiet"
      "splash"
      "loglevel=3"
      "rd.udev.log_priority=3"
      "vt.global_cursor_default=0"
    ];

    plymouth = { enable = true; };
  };

  console = { earlySetup = true; };
}
