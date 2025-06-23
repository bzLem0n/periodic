
# periodic

Personal Home-manager and NixOS configurations for the devices on the lem0n.zapto.org network.


## New Installation

* Boot the system to be installed from a NixOS live image.

* Set a password for the 'nixos' user and note the ip address.
  ```bash
  passwd
  ip a
  ```

* Continue the installation on another device via ssh.
  ```bash
  ssh nixos@192.168.1.1
  ```

* Choose a disk layout and create a disko configuration (`/tmp/disk-config.nix`) for it.  See the following examples:
  * https://github.com/nix-community/disko-templates
  * https://github.com/nix-community/disko/tree/master/example

* Run disko to setutp disks and filesystems.
  ```bash
  sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount /tmp/disk-config.nix
  ```

* Generate a hardware-configuration.nix for the system, copy it
  ```bash
  sudo nixos-generate-config --no-filesystems --root /mnt
  ```

* Clone the git repo to the system in the proper location.
  ```bash
  sudo mkdir -p /mnt/home/kcrook/code/github/bzLem0n/periodic
  sudo chown -R nixos:users /mnt/home/kcrook
  cd /mnt/home/kcrook/code/github/bzLem0n/periodic
  git clone https://github.com/bzLem0n/periodic.git .
  ```

* Create a new host by copying and exising one and overwriting the (`hardware-configuration.nix`, `disk-config.nix`) files.  Edit the new configs as needed.
  ```bash
  cp -r ./nix/nixosConfigurations/palladium ./nix/nixosConfigurations/hostname
  cp /mnt/etc/nixos/hardware-configuration.nix ./nix/nixosConfigurations/hostname/
  sudo rm /mnt/etc/nixos/*
  cp /tmp/disk-config.nix ./nix/nixosConfigurations/hostnaem/
  ```

* Install NixOS and reboot into the new system.
  ```bash
  sudo nixos-install --no-root-passwd --flake .#hostname
  sync && sudo umount -r /mnt
  sudo reboot
  ```


## Host: palladium

This laptop is too underspecced to build its own NixOS install.  Updates are done on host krypton with the USB drive plugged in to that host.

* Mount the filesystems.
  ```bash
  sudo nix run github:nix-community/disko/latest -- --mode mount --flake github:bzLem0n/periodic#palladium
  ```

* Install the system update.
  ```bash
  sudo nixos-install --root /mnt --no-root-passwd --flake github:bzLem0n/periodic#palladium
  ```

* Unmount the filesystems.
  ```bash
  sync
  sudo umount -R /mnt
  ```
