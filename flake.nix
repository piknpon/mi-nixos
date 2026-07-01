{
  description = "Mi configuración profesional de NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: {
    nixosConfigurations.vm-red = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ ./hosts/vm-red/default.nix ];
    };
     
    nixosConfigurations.vm-pink = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ ./hosts/vm-pink/default.nix ];
    };
  };
}
