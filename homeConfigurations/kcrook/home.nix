{ config, pkgs, lib, ... }: {
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
  };
}
