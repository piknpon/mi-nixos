{ lib, ... }:
{
  # Esto le dice a Nix: "Busca todo lo que haya en estas carpetas y cárgalo como módulos"
  imports = lib.filesystem.listFilesRecursive ./.;
}
