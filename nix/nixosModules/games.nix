{
  inputs,
  config,
  pkgs,
  lib,
  ...
}:
{
  jovian = {
    steam.enable = true;
    steamos.useSteamOSConfig = false;
  };

  programs = {
    steam = {
      enable = true;
      extraCompatPackages = with pkgs; [
        proton-ge-custom
      ];
    };
  };
}
