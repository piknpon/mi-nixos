{ lib, ... }:
{
  imports = 
    lib.filesystem.listFilesRecursive ./desktop ++
    lib.filesystem.listFilesRecursive ./programs;
}
