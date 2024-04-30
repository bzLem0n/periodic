{ inputs, config, pkgs, lib, ... }: {
  imports = [
    inputs.self.nixosModules.neovim
    inputs.self.nixosModules.nix
    inputs.self.nixosModules.user-kcrook
  ];
}
