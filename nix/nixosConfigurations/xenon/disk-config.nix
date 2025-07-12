{
  disko.devices = {
    disk = {

      "sata-ssd" = {
        type = "disk";
        device = "/dev/disk/by-id/ata-Samsung_SSD_850_EVO_500GB_S2RANXAH180187P";
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
                pool = "zssd";
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

      "nvme-ssd" = {
        type = "disk";
        device = "/dev/disk/by-id/nvme-WDS500G2X0C-00L350_183055423956";
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
                mountpoint = "/boot-backup";
              };
            };
            "zfs" = {
              end = "-8G";
              content = {
                type = "zfs";
                pool = "zssd";
              };
            };
            "swap" = {
              size = "100%";
              type = "8300";
              content = {
                type = "swap";
              };
            };
          };
        };
      };

      "sata-hdd1" = {
        type = "disk";
        device = "/dev/disk/by-id/ata-ST4000DM000-1F2168_Z306XQHS";
        content = {
          type = "gpt";
          partitions = {
            zfs = {
              size = "100%";
              content = {
                type = "zfs";
                pool = "zhdd";
              };
            };
          };
        };
      };

      "sata-hdd2" = {
        type = "disk";
        device = "/dev/disk/by-id/ata-ST4000DM005-2DP166_WDH2LNEZ";
        content = {
          type = "gpt";
          partitions = {
            zfs = {
              size = "100%";
              content = {
                type = "zfs";
                pool = "zhdd";
              };
            };
          };
        };
      };

      "sata-hdd3" = {
        type = "disk";
        device = "/dev/disk/by-id/ata-ST4000VN000-2AH166_WDH034T5";
        content = {
          type = "gpt";
          partitions = {
            zfs = {
              size = "100%";
              content = {
                type = "zfs";
                pool = "zhdd";
              };
            };
          };
        };
      };
    };

    zpool = {
      "zssd" = {
        type = "zpool";
        mode = "mirror";
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
          "DATA/http" = {
            type = "zfs_fs";
            mountpoint = "/srv/http";
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

      "zhdd" = {
        type = "zpool";
        mode = "mirror";
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
          };
          "SYSTEM/NIXOS" = {
            type = "zfs_fs";
            options.mountpoint = "none";
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
          "DATA/HOME/KCROOK" = {
            type = "zfs_fs";
            options.mountpoint = "none";
          };
          "DATA/HOME/KCROOK/temp" = {
            type = "zfs_fs";
            mountpoint = "/home/kcrook/temp";
            options.mountpoint = "legacy";
            options.canmount = "on";
          };
          "DATA/backup" = {
            type = "zfs_fs";
            mountpoint = "/srv/backup";
            options.mountpoint = "legacy";
            options.canmount = "on";
          };
          "DATA/library" = {
            type = "zfs_fs";
            mountpoint = "/srv/library";
            options.mountpoint = "legacy";
            options.canmount = "on";
          };

          "VM" = {
            type = "zfs_fs";
            options.mountpoint = "none";
          };
          "VM/LIBVIRT" = {
            type = "zfs_fs";
            options.mountpoint = "none";
          };
          "VM/LIBVIRT/large" = {
            type = "zfs_fs";
            mountpoint = "/var/lib/libvirt/large";
            options.mountpoint = "legacy";
            options.canmount = "on";
          };
        };
      };
    };
  };
}
