{ config, pkgs, lib, ... }: {
  home = {
    username = "kcrook";
    homeDirectory = "/home/kcrook";
    stateVersion = "23.11";

    file.".nethackrc".source = ./dots/nethackrc;
  };

  programs.home-manager.enable = true;
}
