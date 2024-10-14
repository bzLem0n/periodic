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
      substituters = [
        "http://192.168.1.36"
        "https://nix-community.cachix.org/"
        "https://cache.nixos.org/"
      ];
      trusted-public-keys = [
        "192.168.1.36:Qk09ZP8fzCnd2i3deuhofyPSGa/M9O1gQZIFzGs/5gY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      ];
      trusted-users = [ "root" "@wheel" ];
    };
  };
}
