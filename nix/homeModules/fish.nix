{
  config,
  pkgs,
  lib,
  ...
}:
{
  #  home.packages = with pkgs; [ ];

  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';

    plugins = [
      {
        name = "bang-bang";
        src = pkgs.fishPlugins.bang-bang.src;
      }
      {
        name = "colored-man-pages";
        src = pkgs.fishPlugins.colored-man-pages.src;
      }
      {
        name = "done";
        src = pkgs.fishPlugins.done.src;
      }
      {
        name = "fzf-fish";
        src = pkgs.fishPlugins.fzf-fish.src;
      }
      {
        name = "grc";
        src = pkgs.fishPlugins.grc.src;
      }
      {
        name = "tide";
        src = pkgs.fishPlugins.tide.src;
      }
    ];

    shellAliases = {
      cat = "bat";
      df = "grc df --local --print-type --exclude tmpfs --exclude devtmpfs --human-readable";
      diff = "difft";
      dufl = "duf -only local";
      dust = "dust --reverse --ignore_hidden --limit-filesystem";
      less = "moor";
      lsblk = "grc lsblk --tree=NAME --output=NAME,MOUNTPOINTS,PARTLABEL,SIZE,TYPE,ROTA,RM,MODEL";
      swapon = "swapon --show=NAME,LABEL,TYPE,SIZE,USED,PRIO";
      nvim = "nvim --clean";

      cp = "cp -v";
      mv = "mv -v";
      rm = "rm -v";
      mkdir = "mkdir -p -v";

      ls = "eza --no-quotes --icons=auto --color=auto";
      ll = "eza --long --time-style=relative --no-quotes --icons=auto --color=auto";
      la = "eza --all --all --no-quotes --icons=auto --color=auto";
      lla = "eza --all --all --long --time-style=relative --no-quotes --icons=auto --color=auto";
      ld = "eza --only-dirs --no-quotes --icons=auto --color=auto";
      lf = "eza --only-files --no-quotes --icons=auto --color=auto";
      lr = "eza --tree --no-quotes --icons=auto --color=auto";
      lsz = "eza --long --sort=size --total-size --no-permissions --no-time --no-user --no-quotes --icons=auto --color=auto";
      ltm = "eza --long --sort=time --time-style=relative --no-permissions --no-filesize --no-user --no-quotes --icons=auto --color=auto";
    };
  };
}
