{
  config,
  pkgs,
  lib,
  ...
}:
{
  programs = {
    difftastic = {
      enable = true;
      git.enable = true;
    };
    git = {
      enable = true;
      settings.user = {
        email = "kevinwaynecrook@gmail.com";
        name = "Kevin Crook";
      };
    };
  };
}
