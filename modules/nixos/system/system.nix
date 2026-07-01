{ pkgs, ... }:
{
  # Habilitar Flakes y comandos modernos de Nix
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Configuración básica del sistema
  time.timeZone = "America/Lima"; # Ajusta a tu zona horaria
  i18n.defaultLocale = "es_PE.UTF-8";

  # Paquetes mínimos indispensables para administrar el sistema
  environment.systemPackages = with pkgs; [
    git
    vim
    wget
    curl
  ];

  # Permitir software privativo si es necesario
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "24.05"; # Mantén la versión base de tu instalación
}
