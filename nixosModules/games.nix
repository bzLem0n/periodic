{
  inputs,
  config,
  pkgs,
  lib,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    steam-run
  ];

  programs = {
    gamescope = {
      enable = true;
      capSysNice = true;
    };
    steam = {
      enable = true;
      gamescopeSession.enable = true;
      extraPackages = with pkgs; [
        gamescope
        mangohud
      ];
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };
  };

  # services = { };
}
