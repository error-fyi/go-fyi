{
  description = "error.fyi library nix flake";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.gomod2nix.url = "github:nix-community/gomod2nix";
  inputs.devshell.url = "github:numtide/devshell";

  outputs = { self, nixpkgs, flake-utils, gomod2nix, devshell }:
    (flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = import nixpkgs {
            inherit system;
            overlays = [ gomod2nix.overlays.default devshell.overlays.default ];
          };
        in
        {
          packages.default = pkgs.callPackage ./. { };
          devShells.default = import ./.nix/shell.nix { inherit pkgs; };
        })
    );
}
