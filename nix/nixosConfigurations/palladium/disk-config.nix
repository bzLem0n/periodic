{
  disko.devices = {
    disk = {
      "uas-ssd" = {
        type = "disk";
        device = "/dev/disk/by-id/ata-SSD_240GB_TD19080002817";
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
              };
            };
            "luks" = {
              size = "100%";
              content = {
                type = "luks";
                name = "crypted";
                settings.allowDiscards = true;
                content = {
                  type = "lvm_pv";
                  vg = "palladium-uas";
                };
              };
            };
          };
        };
      };
    };
    lvm_vg = {
      "palladium-uas" = {
        type = "lvm_vg";
        lvs = {
          root = {
            size = "100%";
            content = {
              type = "filesystem";
              format = "ext4";
              mountpoint = "/";
              mountOptions = [
                "defaults" "relatime" "discard"
              ];
            };
          };
          swap = {
            size = "6G";
            content = {
              type = "swap";
              discardPolicy = "both";
              resumeDevice = true;
            };
          };
        };
      };
    };
  };
}
