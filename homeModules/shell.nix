{ config, pkgs, lib, ... }: {
  home = {
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
    ];
  };

  programs = {
    bash.enable = true;
    bat.enable = true;
    direnv.enable = true;
    direnv.nix-direnv.enable = true;
    htop.enable = true;
    jq.enable = true;
    ripgrep.enable = true;
    ssh.enable = true;
    yt-dlp.enable = true;
  };
}
