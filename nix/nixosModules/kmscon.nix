{
  inputs,
  config,
  pkgs,
  lib,
  ...
}: {
  services.kmscon = {
    enable = true;
    extraConfig = "font-size=18";
    extraOptions = "--term xterm-256color";
    fonts = [ { name = "FiraCode Nerd Font Mono"; package = pkgs.nerd-fonts.fira-code; } ];
    hwRender = true; # Enable 3D hardware acceleration
  };
}
