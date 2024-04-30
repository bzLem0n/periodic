{ inputs, config, pkgs, lib, ... }: {
  imports = [
    inputs.self.nixosModules.locale
    inputs.self.nixosModules.neovim
    inputs.self.nixosModules.nix
    inputs.self.nixosModules.user-kcrook
  ];
}
