{
  config,
  pkgs,
  lib,
  ...
}:
{
  imports = [
    ./vscodium.nix
  ];

  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    extraConfig = builtins.readFile ./../homeConfigurations/kcrook/dots/wezterm.lua;
  };
}
