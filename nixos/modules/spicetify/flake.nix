{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
  };

  outputs = { self, nixpkgs, spicetify-nix, ... }:
    let
      system = "x86_64-linux"; # change if needed
      pkgs = nixpkgs.legacyPackages.${system};
      spicePkgs = spicetify-nix.legacyPackages.${system};
    in {
      nixosConfigurations.your-hostname = pkgs.nixosSystem {
        system = system;
        modules = [
          {
            programs.spicetify = {
              enable = true;

              enabledExtensions = with spicePkgs.extensions; [
                adblock
                hidePodcasts
                shuffle
              ];

              enabledCustomApps = with spicePkgs.apps; [
                newReleases
                ncsVisualizer
              ];

              enabledSnippets = with spicePkgs.snippets; [
                rotatingCoverart
                pointer
              ];

              theme = spicePkgs.themes.catppuccin;
              colorScheme = "mocha";
            };
          }
        ];
      };
    };
}

