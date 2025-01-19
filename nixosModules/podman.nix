{ config, pkgs, lib, ... }: {
  virtualisation = {
    containers.enable = true;
    oci-containers.backend = "podman";
    podman = {
      enable = true;
      autoPrune.enable = true;
      defaultNetwork.settings.dns_enabled = true;
      dockerCompat = true;
    };
  };
  environment.systemPackages = with pkgs; [
    dive # look into docker image layers
    podman
    podman-tui # Terminal mgmt UI for Podman
    passt # For Pasta rootless networking
  ];
}
