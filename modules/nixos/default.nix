{ lib, ... }:
{
  # Esto escanea automáticamente 'config' y 'system'
  imports = lib.filesystem.listFilesRecursive ./.;
}
