{ lib, ... }:
{
  imports = 
    ./services/ssh/default.nix
    lib.filesystem.listFilesRecursive ./system ++
    lib.filesystem.listFilesRecursive ./config;
}
