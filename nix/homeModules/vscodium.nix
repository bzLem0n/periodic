{
  config,
  pkgs,
  lib,
  ...
}:
{
  programs.vscodium = {
    enable = true;
    package = pkgs.vscodium.fhs;
    # extensions = with pkgs.vscode-extensions; [
    #   vscodevim.vim
    # ];
  };
}
