{ config, pkgs, lib, ... }: {
  home = {
    packages = with pkgs; [ zsh-powerlevel10k ];
  };

  programs.zsh = {
    enable = true;
    autocd = true;
    enableAutosuggestions = true;
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
      df = "grc df --local --print-type --exclude tmpfs --exclude devtmpfs --human-readable";
      diff = "difft";
      less = "moar";
      lsblk = "grc lsblk --tree=NAME --output=NAME,MOUNTPOINTS,PARTLABEL,SIZE,TYPE,ROTA,RM,MODEL";
      swapon = "swapon --show=NAME,LABEL,TYPE,SIZE,USED,PRIO";
      ls = "eza --icons --color=always --group-directories-first";
      ll = "eza -al --icons --color=always --group-directories-first";
      la = "eza -aal --icons --color=always --group-directories-first";
      ld = "eza -ld --icons --color=always";
      lf = "eza -lf --icons --color=always";
      lr = "eza -T --icons --color=always --git-ignore --group-directories-first";
      lt = "eza -lT --icons --color=always --git-ignore --sort=modified";
      lsz = "eza -alF --icons --color=always --git-ignore --sort=size | grep -v /";
    };
  };
}
