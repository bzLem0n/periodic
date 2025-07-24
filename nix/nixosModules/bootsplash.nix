{
  config,
  pkgs,
  lib,
  ...
}:
{
  console.earlySetup = true;

  boot = {
    plymouth = {
      enable = true;
      font = "${pkgs.hack-font}/share/fonts/truetype/Hack-Regular.ttf";
      logo = "${pkgs.nixos-icons}/share/icons/hicolor/128x128/apps/nix-snowflake.png";
    };

    consoleLogLevel = 3;
    initrd.verbose = false;

    kernelParams = [
      "quiet"
      "splash"
      "udev.log_priority=3"
      "rd.systemd.show_status=auto"
      "vt.global_cursor_default=0"
    ];
  };

  systemd.services."display-manager" = {
    conflicts = [ "plymouth-quit.service" ];
    preStart = "${pkgs.plymouth}/bin/plymouth deactivate";
    script = "/run/current-system/sw/bin/sddm";
    postStart = "/bin/sh -c 'sleep 5 && ${pkgs.plymouth}/bin/plymouth quit --retain-splash'";
    enable = true;
  };
}
