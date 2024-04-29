{ inputs, ... }: {
  system = "x86_64-linux";
  modules = [
    ./configuration.nix
    inputs.self.nixosModules.boot
    inputs.self.nixosModules.intelgpu
    inputs.self.nixosModules.libvirt
    inputs.self.nixosModules.network
    inputs.self.nixosModules.podman
  ];
}

