{ config, pkgs, lib, ... }: {
  home.packages = with pkgs; [ zsh-powerlevel10k ];

  programs.zsh = {
    enable = true;
    autocd = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    enableVteIntegration = true;
    syntaxHighlighting.enable = true;

    history = {
      size = 100000;
      save = 100000;
      path = "${config.xdg.dataHome}/.zsh_history";
    };

    initExtra = ''
      source ~/.nix-profile/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
    '';

    oh-my-zsh = {
      enable = true;
      plugins = [ "colored-man-pages" "git" "sudo" "tmux" "direnv" "history" ];
    };

    shellAliases = {
      cat = "bat";
      df =
        "grc df --local --print-type --exclude tmpfs --exclude devtmpfs --human-readable";
      diff = "difft";
      less = "moar";
      lsblk =
        "grc lsblk --tree=NAME --output=NAME,MOUNTPOINTS,PARTLABEL,SIZE,TYPE,ROTA,RM,MODEL";
      swapon = "swapon --show=NAME,LABEL,TYPE,SIZE,USED,PRIO";

      ls  = "eza --no-quotes --icons=auto --color=auto";
      la  = "eza --all --all --no-quotes --icons=auto --color=auto";
      ld  = "eza --long --only-dirs --time-style=relative --no-quotes --icons=auto --color=auto";
      lf  = "eza --long --only-files --time-style=relative --no-quotes --icons=auto --color=auto";
      ll  = "eza --all --long --time-style=relative --no-quotes --icons=auto --color=auto";
      lr  = "eza --tree --no-quotes --icons=auto --color=auto";
      lsz = "eza --long --sort=size --total-filesize --no-permisions --no-time --no-user --no-quotes --icons=auto --color=auto";
      ltm = "eza --long --sort=time --no-permisions --no-size --no-user --no-quotes --icons=auto --color=auto";
    };
  };
}
