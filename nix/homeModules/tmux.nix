{
  config,
  pkgs,
  lib,
  ...
}:
{
  programs.tmux = {
    enable = true;
    clock24 = true;
    keyMode = "vi";
    shortcut = "b";
    terminal = "screen-256color";
  };
}
