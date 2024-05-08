{
  description = "Home-manager flake using flakelight";

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

    lanzaboote = {
      url = "github:nix-community/lanzaboote";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    peerix = {
      url = "github:cid-chan/peerix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { flakelight, home-manager, disko, lanzaboote, peerix, ... }@inputs:
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
