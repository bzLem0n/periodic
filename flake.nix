{
  description = "Home-manager flake using flakelight";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flakelight = {
      url = "github:nix-community/flakelight";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { flakelight, home-manager, disko, ... }@inputs:
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
