{ lib, ... }:
{
  imports = 
    lib.filesystem.listFilesRecursive ./system ++
    lib.filesystem.listFilesRecursive ./config;
}
