{ inputs, config, pkgs, lib, ... }: {
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager = {
    useGlobalPkgs = true;
    users.kcrook = {
      imports = [
        ../homeConfigurations/kcrook/home.nix
        inputs.self.homeModules.shell
        inputs.self.homeModules.fish
        inputs.self.homeModules.tmux
        inputs.self.homeModules.neovim
        inputs.self.homeModules.git
        ../homeModules/desktop.nix
      ];
    };
  };

  programs.fish.enable = true;

  users.users.kcrook = {
    isNormalUser = true;
    description = "Kevin Crook";
    extraGroups =
      [ "adbusers" "docker" "libvirtd" "networkmanager" "pipewire" "wheel" ];
    shell = pkgs.fish;
    initialPassword = "changeme";
  };
}
