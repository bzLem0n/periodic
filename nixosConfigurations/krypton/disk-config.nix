{
  disko.devices = {
    disk = {
      one = {
        type = "disk";
        device = "/dev/disk/by-id/ata-ADATA_SP550_2G2720014934";
        content = {
          type = "gpt";
          partitions = {
            BOOT = {
              size = "1M";
              type = "EF02";
              priority = 1;
            };
            ESP = {
              size = "2G";
              type = "EF00";
              content = {
                name = "boot";
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
              };
            };
            mdadm = {
              size = "100%";
              content = {
                type = "mdraid";
                name = "mirror";
              };
            };
          };
        };
      };
      two = {
        type = "disk";
        device = "/dev/disk/by-id/ata-WDC_WDS120G2G0B-00EPW0_190134800060";
        content = {
          type = "gpt";
          partitions = {
            boot = {
              size = "1M";
              type = "EF02";
              priority = 1;
            };
            ESP = {
              size = "2G";
              type = "EF00";
              content = {
                name = "boot1";
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot1";
              };
            };
            mdadm = {
              size = "100%";
              content = {
                type = "mdraid";
                name = "mirror";
              };
            };
          };
        };
      };
    };
    mdadm = {
      mirror = {
        type = "mdadm";
        level = 1;
        content = {
          type = "luks";
          name = "crypted";
          settings.allowDiscards = true;
          content = {
            type = "btrfs";
            extraArgs = [ "-f" ];
            subvolumes = {
              "/root" = {
                mountpoint = "/";
                mountOptions = [ "compress=zstd" "noatime" ];
              };
              "/home" = {
                mountpoint = "/home";
                mountOptions = [ "compress=zstd" "noatime" ];
              };
              "/docker" = {
                mountpoint = "/var/lib/docker";
                mountOptions = [ "compress=zstd" "noatime" ];
              };
              "/libvirt" = {
                mountpoint = "/var/lib/libvirt";
                mountOptions = [ "compress=zstd" "noatime" ];
              };
              "/libvirt/images" = {
                mountpoint = "/var/lib/libvirt/images";
                mountOptions = [ "compress=zstd" "noatime" ];
              };
              "/libvirt/installers" = {
                mountpoint = "/var/lib/libvirt/installers";
                mountOptions = [ "compress=zstd" "noatime" ];
              };
              "/lxd" = {
                mountpoint = "/var/lib/lxd";
                mountOptions = [ "compress=zstd" "noatime" ];
              };
              "/log" = {
                mountpoint = "/log";
                mountOptions = [ "compress=zstd" "noatime" ];
              };
              "/nix" = {
                mountpoint = "/nix";
                mountOptions = [ "compress=zstd" "noatime" ];
              };
              "/persist" = {
                mountpoint = "/persist";
                mountOptions = [ "compress=zstd" "noatime" ];
              };
              "/snapshot" = { };
              "/swap" = {
                mountpoint = "/swapfile";
                swap.swapfile.size = "12G";
              };
            };
          };
        };
      };
    };
  };
}
