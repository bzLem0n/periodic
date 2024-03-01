{ inputs, ... }: {
  system = "x86_64-linux";
  modules = [
    ./home.nix
    inputs.self.homeModules.shell
    inputs.self.homeModules.zsh
    inputs.self.homeModules.tmux
    inputs.self.homeModules.neovim
    inputs.self.homeModules.git
  ];
}
