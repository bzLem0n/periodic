{ inputs, config, pkgs, lib, ... }: {
  imports =
    [ inputs.self.nixosModules.neovim inputs.self.nixosModules.user-kcrook ];
}
