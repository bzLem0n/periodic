{ config, pkgs, lib, ... }: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium.fhs;
    # extensions = with pkgs.vscode-extensions; [
    #   vscodevim.vim
    # ];
  };
}

