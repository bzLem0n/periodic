{
  config,
  pkgs,
  lib,
  ...
}:
{
  home = {
    sessionVariables = {
      EDITOR = "nvim";
      PAGER = "moor -quit-if-one-screen";
    };

    packages = with pkgs; [
      alejandra
      btop
      cifs-utils
      curl
      difftastic
      duf
      dust
      efibootmgr
      eza
      file
      fzf
      glow
      gping
      gptfdisk
      grc
      lrzip
      moor
      mtr
      nethack
      nfs-utils
      nixfmt-tree
      nix-output-monitor
      p7zip
      pciutils
      procs
      psmisc
      rsync
      tealdeer
      usbutils
      vifm
      wget
    ];
  };

  programs = {
    bash.enable = true;
    bat.enable = true;
    direnv.enable = true;
    direnv.nix-direnv.enable = true;
    fastfetch.enable = true;
    htop.enable = true;
    jq.enable = true;
    nix-index.enable = true;
    ripgrep.enable = true;
    ssh.enable = true;
    yt-dlp.enable = true;
  };
}
