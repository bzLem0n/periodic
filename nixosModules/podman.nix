{ config, pkgs, lib, ... }: {
  virtualisation = {
    oci-containers.backend = "podman";
    podman = {
      enable = true;
      defaultNetwork = { settings = { dns_enabled = true; }; };
      dockerCompat = true;
    };
  };
}
