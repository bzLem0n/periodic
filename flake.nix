{
  description = "NixOS and Home Manager flake using flakelight";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-24.11";

    flakelight = {
      url = "github:nix-community/flakelight";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
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
      inputs.darwin.follows = "";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { flakelight, home-manager, disko, agenix, nix-index-database, ... }@inputs:
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
