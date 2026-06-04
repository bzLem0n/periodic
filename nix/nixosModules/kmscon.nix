{
  inputs,
  config,
  pkgs,
  lib,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    nerd-fonts.fira-code
  ];

  services.kmscon = {
    enable = true;
    config.hwaccel = true;
    extraOptions = "--term xterm-256color";
  };
}
