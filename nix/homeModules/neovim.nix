{
  config,
  pkgs,
  lib,
  ...
}:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    plugins = with pkgs.vimPlugins; [
      (nvim-treesitter.withPlugins (
        plugins: with plugins; [
          tree-sitter-c
          tree-sitter-cpp
          tree-sitter-dockerfile
          tree-sitter-fish
          tree-sitter-go
          tree-sitter-html
          tree-sitter-json
          tree-sitter-latex
          tree-sitter-lua
          tree-sitter-nix
          tree-sitter-python
          tree-sitter-r
          tree-sitter-regex
          tree-sitter-rust
          tree-sitter-toml
          tree-sitter-vim
          tree-sitter-yaml
        ]
      ))
      vim-nix
      vim-fugitive
      vim-commentary
    ];

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
      set relativenumber
      set cc=80
      set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
      set wildmenu
      set wildmode=list:longest
      set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
      set clipboard=unnamedplus
      filetype on
      filetype plugin on
      filetype plugin indent on
      set cursorline
      set scrolloff=10
      set nowrap
      set t_8f=[38;2;%lu;%lu;%lum
      set t_8b=[48;2;%lu;%lu;%lum
      set termguicolors
      syntax enable
      set foldmethod=expr
      set foldexpr=nvim_treesitter#foldexpr()
      autocmd BufReadPost,FileReadPost * normal zR
    '';
  };
}
