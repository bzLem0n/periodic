{ inputs, ... }:
{
  system = "x86_64-linux";

  modules = [
    inputs.self.nixosModules.common
    inputs.self.nixosModules.libvirt
    inputs.self.nixosModules.podman
    inputs.self.nixosModules.srv-smb

    inputs.home-manager.nixosModules.home-manager
    inputs.disko.nixosModules.disko

    ./configuration.nix
    ./hardware-configuration.nix
    ./disk-config.nix
  ];
}
