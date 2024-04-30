{ inputs, config, pkgs, lib, ... }: {
  imports = [ inputs.self.nixosModules.user-kcrook ];
}
