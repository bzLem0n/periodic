{
  disko.devices = {
    disk = {
      "nvme-ssd" = {
        type = "disk";
        device = "/dev/disk/by-id/nvme-Samsung_SSD_970_EVO_Plus_500GB_S58SNM0T401944J";
        content = {
          type = "gpt";
          partitions = {
            "esp" = {
              size = "2G";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };
            "zfs" = {
              end = "-16G";
              content = {
                type = "zfs";
                pool = "znvme";
              };
            };
            "swap" = {
              size = "16G";
              type = "8300";
              content = {
                type = "swap";
                resumeDevice = true;
              };
            };
          };
        };
      };

      "sata-hdd" = {
        type = "disk";
        device = "/dev/disk/by-id/ata-WDC_WD30EZRX-00D8PB0_WD-WMC4N1570180";
        content = {
          type = "gpt";
          partitions = {
            "games" = {
              size = "100%";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/mnt/games";
              };
            };
          };
        };
      };
    };

    zpool = {
      "znvme" = {
        type = "zpool";
        rootFsOptions = {
          acltype = "posixacl";
          compression = "zstd";
          devices = "off";
          dnodesize = "auto";
          mountpoint = "none";
          normalization = "formD";
          relatime = "on";
          xattr = "sa";
          "com.sun:auto-snapshot" = "false";
        };

        options = {
          ashift = "12";
          autotrim = "on";
        };

        datasets = {
          "reserved" = {
            type = "zfs_fs";
            options = {
              mountpoint = "none";
              reservation = "10G";
            };
          };

          "SYSTEM" = {
            type = "zfs_fs";
            options.mountpoint = "none";
            options.devices = "on";
          };
          "SYSTEM/NIXOS" = {
            type = "zfs_fs";
            options.mountpoint = "none";
          };
          "SYSTEM/NIXOS/rootfs" = {
            type = "zfs_fs";
            mountpoint = "/";
            postCreateHook = "zfs list -t snapshot -H -o name | grep -E '^znvme/SYSTEM/NIXOS/rootfs@blank$' || zfs snapshot znvme/SYSTEM/NIXOS/rootfs@blank";
          };
          "SYSTEM/NIXOS/nix" = {
            type = "zfs_fs";
            mountpoint = "/nix";
            options.atime = "off";
          };
          "SYSTEM/NIXOS/var" = {
            type = "zfs_fs";
            mountpoint = "/var";
          };
          "SYSTEM/NIXOS/var/lib" = {
            type = "zfs_fs";
            mountpoint = "/var/lib";
          };
          "SYSTEM/NIXOS/var/log" = {
            type = "zfs_fs";
            mountpoint = "/var/log";
          };

          "DATA" = {
            type = "zfs_fs";
            options.mountpoint = "none";
            options."com.sun:auto-snapshot" = "true";
          };
          "DATA/HOME" = {
            type = "zfs_fs";
            options.mountpoint = "none";
          };
          "DATA/HOME/kcrook" = {
            type = "zfs_fs";
            mountpoint = "/home/kcrook";
            postCreateHook = "zfs list -t snapshot -H -o name | grep -E '^znvme/DATA/HOME/kcrook@blank$' || zfs snapshot znvme/DATA/HOME/kcrook@blank";
          };
          "DATA/HOME/root" = {
            type = "zfs_fs";
            mountpoint = "/root";
          };

          "VM" = {
            type = "zfs_fs";
            options.mountpoint = "none";
          };
          "VM/docker" = {
            type = "zfs_fs";
            mountpoint = "/var/docker";
          };
          "VM/lxd" = {
            type = "zfs_fs";
            mountpoint = "/var/lxd";
          };
          "VM/libvirt" = {
            type = "zfs_fs";
            mountpoint = "/var/lib/libvirt";
          };
          "VM/libvirt/images" = {
            type = "zfs_fs";
            mountpoint = "/var/lib/libvirt/images";
          };
          "VM/libvirt/installer" = {
            type = "zfs_fs";
            mountpoint = "/var/lib/libvirt/installer";
          };
        };
      };
    };
  };
}
