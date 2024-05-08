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
                type = "mdraid";
                name = "boot";
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
                type = "mdraid";
                name = "boot";
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
      boot = {
        type = "mdadm";
        level = 1;
        metadata = "1.0";
        content = {
          type = "filesystem";
          format = "vfat";
          mountpoint = "/boot";
        };
      };
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
