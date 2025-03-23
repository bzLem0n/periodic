{ config, pkgs, lib, ... }: {
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [ cachix nix-output-monitor ];

  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      extraArgs = "--keep-since 3d --keep 2";
    };
    flake = "/home/kcrook/code/github/bzLem0n/periodic";
  };
}
