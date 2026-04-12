{
  config,
  pkgs,
  lib,
  ...
}:
{
  programs.neovim = {
    defaultEditor = true;
    enable = true;
    viAlias = true;
    vimAlias = true;

    withRuby = false;
    withPython3 = false;
  };
}
