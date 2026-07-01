{ lib, ... }:
{

  imports = [
    ./user.nix
  ] ++ lib.filesystem.listFilesRecursive ./desktop 
    ++ lib.filesystem.listFilesRecursive ./programs;
}
