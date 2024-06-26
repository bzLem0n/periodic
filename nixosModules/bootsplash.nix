{ config, pkgs, lib, ... }: {
  console.earlySetup = true;

  boot = {
    plymouth.enable = true;

    kernelParams = [
      "quiet"
      "splash"
      "loglevel=3"
      "rd.udev.log_priority=3"
      "vt.global_cursor_default=0"
    ];
  };
}
