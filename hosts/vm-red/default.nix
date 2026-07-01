{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix     # Nuestro hardware generado
    ../../modules/core/default.nix   # Nuestros ingredientes core
  ];

  # Identidad única de esta máquina
  networking.hostName = "vm-red";
  networking.networkmanager.enable = true;

  # Configuración básica de boot (GRUB)
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Opciones globales para todos tus subvolúmenes BTRFS
  # Esto se fusionará con lo que ya está en hardware-configuration.nix
  fileSystems."/".options = [ "compress=zstd" "noatime" ];
  fileSystems."/home".options = [ "compress=zstd" "noatime" ];
  fileSystems."/nix".options = [ "compress=zstd" "noatime" ];
  fileSystems."/persist".options = [ "compress=zstd" "noatime" ];

  system.stateVersion = "24.05";
}
