{
  description = "Mi configuración profesional de NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
 
  outputs = { self, nixpkgs, home-manager, ... }: {
    nixosConfigurations = { 
      
      vm-red = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/vm-red/default.nix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.ciruela = import ./modules/home/ciruela.nix;
          }
        ];
      };

      vm-pink = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/vm-pink/default.nix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.ciruela = import ./modules/home/ciruela.nix;
          }
        ];
      };
    };
  };
}
