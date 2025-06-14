{
  config,
  pkgs,
  lib,
  ...
}:
{
  home.packages = with pkgs; [
    cachix
    nh
    nix-output-monitor
  ];

  home.sessionVariables = {
    NH_FLAKE = "/home/kcrook/code/github/bzLem0n/periodic";
  };

  nix = {
    package = pkgs.nix;
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
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
      trusted-users = [
        "root"
        "@wheel"
      ];
    };
  };
}
