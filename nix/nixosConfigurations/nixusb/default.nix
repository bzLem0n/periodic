{ inputs, ... }:
{
  system = "x86_64-linux";

  modules = [
    inputs.self.nixosModules.common
    inputs.self.nixosModules.desktop
    inputs.self.nixosModules.games

    inputs.home-manager.nixosModules.home-manager
    inputs.disko.nixosModules.disko

    ./configuration.nix
    ./hardware-configuration.nix
    ./disk-config.nix
  ];
}
