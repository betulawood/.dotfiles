{
  description = "NixOS configuration flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  };

  outputs = { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
        system = system;
        modules = [
	      ./configuration.nix
      	  ./hosts/desktop/hardware-configuration.nix
          ./modules/nvim
        ];

      };
    };
}

