{
  disko.devices = {
    disk = {

      "sata-ssd" = {
        type = "disk";
        device =
          "/dev/disk/by-id/ata-ADATA_SP550_2G2720014934";
        content = {
          type = "gpt";
          partitions = {
            "boot" = {
              size = "1M";
              type = "EF02";
              priority = 1;
            };
            "esp" = {
              size = "2G";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
              };
            };
            "zfs" = {
              end = "-8G";
              content = {
                type = "zfs";
                pool = "zpool";
              };
            };
            "swap" = {
              size = "100%";
              type = "8300";
              content = {
                type = "swap";
                resumeDevice = true;
              };
            };
          };
        };
      };
    };

    zpool = {
      "zpool" = {
        type = "zpool";
        rootFsOptions = {
          acltype = "posixacl";
          canmount = "off";
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
            options.mountpoint = "legacy";
            options.canmount = "on";
          };
          "SYSTEM/NIXOS/nix" = {
            type = "zfs_fs";
            mountpoint = "/nix";
            options.mountpoint = "legacy";
            options.canmount = "on";
            options.atime = "off";
          };
          "SYSTEM/NIXOS/var" = {
            type = "zfs_fs";
            mountpoint = "/var";
            options.mountpoint = "legacy";
            options.canmount = "on";
          };
          "SYSTEM/NIXOS/var/lib" = {
            type = "zfs_fs";
            mountpoint = "/var/lib";
            options.mountpoint = "legacy";
            options.canmount = "on";
          };
          "SYSTEM/NIXOS/var/log" = {
            type = "zfs_fs";
            mountpoint = "/var/log";
            options.mountpoint = "legacy";
            options.canmount = "on";
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
            options.mountpoint = "legacy";
            options.canmount = "on";
          };
          "DATA/HOME/root" = {
            type = "zfs_fs";
            mountpoint = "/root";
            options.mountpoint = "legacy";
            options.canmount = "on";
          };

          "VM" = {
            type = "zfs_fs";
            options.mountpoint = "none";
          };
          "VM/docker" = {
            type = "zfs_fs";
            mountpoint = "/var/docker";
            options.mountpoint = "legacy";
            options.canmount = "on";
          };
          "VM/lxd" = {
            type = "zfs_fs";
            mountpoint = "/var/lxd";
            options.mountpoint = "legacy";
            options.canmount = "on";
          };
          "VM/libvirt" = {
            type = "zfs_fs";
            mountpoint = "/var/lib/libvirt";
            options.mountpoint = "legacy";
            options.canmount = "on";
          };
          "VM/libvirt/images" = {
            type = "zfs_fs";
            mountpoint = "/var/lib/libvirt/images";
            options.mountpoint = "legacy";
            options.canmount = "on";
          };
          "VM/libvirt/installer" = {
            type = "zfs_fs";
            mountpoint = "/var/lib/libvirt/installer";
            options.mountpoint = "legacy";
            options.canmount = "on";
          };
        };
      };
    };
  };
}
