{
  description = "NixOS and Home Manager flake using flakelight";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";

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
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.darwin.follows = "";
    };
  };

  outputs = { flakelight, home-manager, disko, agenix, ... }@inputs:
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
