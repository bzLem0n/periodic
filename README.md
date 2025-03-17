
# periodic

Personal Home-manager and NixOS configurations for the devices on the
lem0n.zapto.org network.


## Host: palladium

This laptop is too underspecced to build its own NixOS install.  Updates are
done on host krypton with the USB drive plugged in to that host.

```bash
sudo nix run github:nix-community/disko/latest -- \
     --mode mount \
     --flake github:bzLem0n/periodic#palladium

sudo nixos-install \
     --root /mnt \
     --no-root-passwd \
     --flake github:bzLem0n/periodic#palladium

sudo umount -R /mnt
```
