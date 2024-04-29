{ inputs, ... }: {
  system = "x86_64-linux";
  modules = [
    ./configuration.nix
    inputs.self.nixosModules.network
  ];
}

