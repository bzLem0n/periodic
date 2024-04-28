{ inputs, config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  boot = {
    loader.grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      mirroredBoots = [{
        devices = [ "/dev/disk/by-uuid/BDE6-9262" ];
        path = "/boot-fallback";
      }];
    };
    supportedFilesystems = [ "zfs" ];
  };

  networking = {
    hostName = "krypton";
    hostId = "158b2654";
    firewall.enable = false;
    networkmanager.enable = true;
  };

  time.timeZone = "America/Regina";

  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  services.displayManager.sddm.enable = true;

  services.libinput.enable = true;

  services.xserver = {
    enable = true;
    desktopManager.plasma5.enable = true;
  };

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  users.users.kcrook = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [ firefox ];
    shell = pkgs.zsh;
  };

  home-manager = {
    useGlobalPkgs = true;
    users.kcrook = {
      imports = [
        ../../homeConfigurations/kcrook/home.nix
        inputs.self.homeModules.shell
        inputs.self.homeModules.zsh
        inputs.self.homeModules.tmux
        inputs.self.homeModules.neovim
        inputs.self.homeModules.git
      ];
    };
  };

  environment.systemPackages = with pkgs; [ wget ];

  programs = {
    git.enable = true;
    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
    };
    zsh.enable = true;
  };

  services.openssh.enable = true;

  system.stateVersion = "23.11";

}

