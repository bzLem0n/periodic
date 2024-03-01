{ config, pkgs, lib, ... }: {
  programs.git = {
    enable = true;
    difftastic.enable = true;
    userEmail = "kevinwaynecrook@gmail.com";
    userName = "Kevin Crook";
  };
}
