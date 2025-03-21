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

    agenix = {
      url = "github:ryantm/agenix";
      inputs.home-manager.follows = "nixpkgs";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.systems.follows = "systems";
      inputs.darwin.follows = "";
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

  outputs = { flakelight, home-manager, disko, agenix, nix-index-database, stylix, systems, ... }@inputs:
    flakelight ./. {
      inherit inputs;

      nixDir = ./.;

      devShell.packages = pkgs:
        with pkgs; [
          nixpkgs-fmt
          markdownlint-cli2
          git
        ];

      formatters = {
        "*.nix" = "nixpkgs-fmt";
        "*.md" = "markdownlint-cli2";
      };
    };
}
