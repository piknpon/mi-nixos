{ lib, ... }:

let
  # Función para listar archivos .nix ignorando este mismo archivo
  recursiveImports = dir:
    let
      files = builtins.readDir dir;
      list = lib.flatten (lib.mapAttrsToList (name: type:
        if type == "directory" then recursiveImports (dir + "/${name}")
        else if (type == "regular" && name != "default.nix" && lib.hasSuffix ".nix" name)
        then [(dir + "/${name}")]
        else []
      ) files);
    in list;
in {
  imports = recursiveImports ./.;
}
