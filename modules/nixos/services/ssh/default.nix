{ ... }:
{
  services.openssh = {
    enable = true;
    # Por seguridad, deshabilitamos el login con contraseña si prefieres usar llaves
    settings = {
      PasswordAuthentication = true;
      PermitRootLogin = "no";
    };
  };
}
