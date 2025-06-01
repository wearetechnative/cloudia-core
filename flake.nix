{
  description = "Cloudia Core";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      allSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];

      forAllSystems = f:
        nixpkgs.lib.genAttrs allSystems (system:
          f {
            pkgs = import nixpkgs {
              inherit system;
            };
          });
    in {
      devShells = forAllSystems ({ pkgs }:
        {
          default = pkgs.mkShell {
          buildInputs = [
            # Elixir and Erlang
            pkgs.elixir # >= 1.18
            pkgs.erlang

            # Development tools
            pkgs.inotify-tools  # For file_system used by Phoenix live reload
            pkgs.watchman
            pkgs.git

            pkgs.tailwindcss_4
            pkgs.esbuild
          ];

          shellHook = ''
            echo "Elixir and Ash Framework Development Environment"
            echo ""
            echo "Add these to your config.exs..."
            echo "esbuild path: ${pkgs.lib.getExe pkgs.esbuild}""
            echo "tailwind path: ${pkgs.lib.getExe pkgs.tailwindcss_4}""
            /usr/bin/env zsh
          '';
        };
      });
    };
}
