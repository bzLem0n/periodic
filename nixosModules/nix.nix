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

  nix = {
    settings.experimental-features = [ "nix-command" "flakes" ];
    settings = {
      extra-substituters = [
        "http://192.168.1.36"
        "https://nix-community.cachix.org/"
      ];
      extra-trusted-public-keys = [
        "192.168.1.36:tEdLEHu8aGnsnr/XL4uulyytFZjS6QTtASO49Z0af28="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
      trusted-users = [ "root" "@wheel" ];
    };
  };
}
