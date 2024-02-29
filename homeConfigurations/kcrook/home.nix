{ config
, pkgs
, lib
, ...
}: {
  home = {
    username = "kcrook";
    homeDirectory = "/home/kcrook";
    stateVersion = "23.11";

    sessionVariables = {
      EDITOR = "nvim";
      PAGER = "moar -quit-if-one-screen";
    };

    packages = with pkgs; [
      alejandra
      chatgpt-cli
      cifs-utils
      curl
      difftastic
      duf
      efibootmgr
      eza
      file
      gping
      gptfdisk
      grc
      lrzip
      moar
      mtr
      nethack
      nfs-utils
      nixfmt
      nixpkgs-fmt
      nix-output-monitor
      p7zip
      pciutils
      procs
      psmisc
      rsync
      spotify-player
      tealdeer
      usbutils
      vifm
      wget
      zsh-powerlevel10k
    ];
  };

  programs = {
    home-manager.enable = true;
    bash.enable = true;
    bat.enable = true;
    direnv.enable = true;
    direnv.nix-direnv.enable = true;
    htop.enable = true;
    jq.enable = true;
    ripgrep.enable = true;
    ssh.enable = true;
    yt-dlp.enable = true;

    git = {
      enable = true;
      difftastic.enable = true;
      userEmail = "kevinwaynecrook@gmail.com";
      userName = "Kevin Crook";
    };

    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      extraConfig = ''
        set nocompatible
        set mouse=
        set history=1000
        set showcmd
        set showmode
        set showmatch
        set smartcase
        set hlsearch
        set incsearch
        set tabstop=4
        set softtabstop=4
        set expandtab
        set shiftwidth=4
        set autoindent
        set number
        set cc=80
        set wildmenu
        set wildmode=list:longest
        set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
        set clipboard=unnamedplus
        syntax on
        filetype on
        filetype plugin on
        filetype plugin indent on
        set cursorline
        set scrolloff=10
        set nowrap
      '';
    };

    tmux = {
      enable = true;
      clock24 = true;
      keyMode = "vi";
      shortcut = "b";
      terminal = "screen-256color";
    };
    zsh = {
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
  };
}
