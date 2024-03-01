{ config, pkgs, lib, ... }: {
  home = {
    username = "kcrook";
    homeDirectory = "/home/kcrook";
    stateVersion = "23.11";
  };

  programs = {
    home-manager.enable = true;

    git = {
      enable = true;
      difftastic.enable = true;
      userEmail = "kevinwaynecrook@gmail.com";
      userName = "Kevin Crook";
    };
  };
}
