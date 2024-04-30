{ config, pkgs, lib, ... }: {
  programs.neovim = {
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
}
