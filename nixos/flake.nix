{
  description = "NixOS configuration flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    android-nixpkgs.url = "github:/tadfisher/android-nixpkgs";
  };

  outputs = { self, nixpkgs, spicetify-nix, android-nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      spicePkgs = spicetify-nix.legacyPackages.${system};
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

      programs.nix-ld.enable = true;
      programs.spicetify = {
        enable = true;
        theme = spicePkgs.themes.catppuccin;
        colorScheme = "mocha";
      };
      packages.x86_64-linux.android-sdk = android-nixpkgs.sdk (sdkPkgs: with sdkPkgs; [
        cmdline-tools-latest
        build-tools-34-0-0
        platform-tools
        platforms-android-34
        emulator
      ]);
      android-studio = pkgs.androidStudioPackages.stable;
    };
}

