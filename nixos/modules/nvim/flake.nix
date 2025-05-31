{
  description = "Dev environment with Neovim and languages";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  };

  outputs = { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.default = pkgs.mkShell {
        buildInputs = [
          pkgs.neovim
          pkgs.nodejs        # JavaScript/TypeScript
          pkgs.python3       # Python
          pkgs.rustc         # Rust compiler
          pkgs.go            # Go language
          pkgs.gcc           # C/C++ compiler
          pkgs.git           # Git for version control
        ];
      };
    };
}

