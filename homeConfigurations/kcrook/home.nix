{ config, pkgs, lib, ... }: {
  home = {
    username = "kcrook";
    homeDirectory = "/home/kcrook";
    stateVersion = "23.11";
  };

  programs = { home-manager.enable = true; };
}
