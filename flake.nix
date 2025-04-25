{
  description = "NixOS and Home Manager flake using flakelight";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    flakelight = {
      url = "github:nix-community/flakelight";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix/release-24.11";
      inputs.home-manager.follows = "nixpkgs";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.systems.follows = "systems";
    };

    systems.url = "github:nix-systems/x86_64-linux";
  };

  nixConfig = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    extra-substituters = [
      "http://192.168.1.36/"
      "https://nix-community.cachix.org/"
      "https://cache.nixos.org/"
    ];
    extra-trusted-public-keys = [
      "192.168.1.36-1:jecpDmt3fNblbGi/8ZwpxsY2z8rs9BDs6ZMaNs9LrGk="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
    ];
    trusted-users = [
      "root"
      "@wheel"
    ];
  };

  outputs =
    {
      flakelight,
      home-manager,
      disko,
      nix-index-database,
      stylix,
      systems,
      ...
    }@inputs:
    flakelight ./. {
      inherit inputs;

      nixDir = ./.;

      devShell.packages =
        pkgs: with pkgs; [
          nixfmt-tree
          markdownlint-cli2
          git
        ];

      formatters = {
        "*.nix" = "nixfmt-tree";
        "*.md" = "markdownlint-cli2";
      };
    };
}
