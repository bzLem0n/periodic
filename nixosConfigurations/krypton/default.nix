{ inputs, ... }: {
  system = "x86_64-linux";

  modules = [
    inputs.self.nixosModules.common
    inputs.self.nixosModules.desktop
    inputs.self.nixosModules.intelgpu
    inputs.self.nixosModules.libvirt
    inputs.self.nixosModules.nixcache
    inputs.self.nixosModules.podman

    inputs.home-manager.nixosModules.home-manager
    inputs.disko.nixosModules.disko

    ./configuration.nix
    ./hardware-configuration.nix
    ./disk-config.nix
  ];
}
