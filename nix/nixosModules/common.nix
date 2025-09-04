{
  inputs,
  config,
  pkgs,
  lib,
  ...
}:
{
  imports = [
    inputs.self.nixosModules.boot
    inputs.self.nixosModules.locale
    inputs.self.nixosModules.neovim
    inputs.self.nixosModules.network
    inputs.self.nixosModules.nix
    inputs.self.nixosModules.theme
    inputs.self.nixosModules.user-kcrook

    inputs.nix-index-database.nixosModules.nix-index
    inputs.stylix.nixosModules.stylix
    inputs.jovian.nixosModules.default
    inputs.chaotic.nixosModules.default
  ];

  programs.nix-index.enable = true;

  services.userborn.enable = true;
}
