{ inputs, config, pkgs, lib, ... }: {
  imports = [
    inputs.self.nixosModules.boot
    inputs.self.nixosModules.locale
    inputs.self.nixosModules.neovim
    inputs.self.nixosModules.network
    inputs.self.nixosModules.nix
    inputs.self.nixosModules.user-kcrook
  ];
}
