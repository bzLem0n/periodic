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

  jovian.steam.eanble = true;

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
        proton-ge-custom
      ];
    };
  };

  # services = { };
}
