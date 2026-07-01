{ lib, ... }:
{
  # Esto escanea automáticamente 'desktop' y 'programs'
  imports = lib.filesystem.listFilesRecursive ./.;
}
