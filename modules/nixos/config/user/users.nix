{ pkgs, ... }:
{
  users.users.ciruela = {
    isNormalUser = true;
    description = "Usuario Principal";
    extraGroups = [ "wheel" "networkmanager" ]; # 'wheel' da acceso a sudo
    initialPassword = "nixos"; # Contraseña temporal para el primer login
    shell = pkgs.bash;
  };
}
