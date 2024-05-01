{ config, pkgs, lib, ... }: {
  environment.systemPackages = [ pkgs.OVMF pkgs.qemu pkgs.swtpm pkgs.usbutils ];

  virtualisation.libvirtd = {
    allowedBridges = [ "br0" ];
    enable = true;
    qemu.swtpm.enable = true;
  };
}
