# /etc/nixos/modules/services/openssh.nix
{ config, lib, pkgs, ... }:

let
  cfg = config.myServices.openssh;
in {
  options.myServices.openssh = {
    enable = lib.mkEnableOption "Habilita OpenSSH seguro en el host";
    port = lib.mkOption {
      type = lib.types.port;
      default = 22;
      description = "Puerto de escucha SSH";
    };
  };

  config = lib.mkIf cfg.enable {
    services.openssh = {
      enable = true;
      ports = [ cfg.port ];
      settings = {
        PasswordAuthentication = true; # Puedes cambiar a false si usas llaves SSH
        PermitRootLogin = "no";
      };
    };
    networking.firewall.allowedTCPPorts = [ cfg.port ];
  };
}
