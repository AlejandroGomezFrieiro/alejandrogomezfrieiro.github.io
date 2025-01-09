`flake-parts` is a tool for generating a [[nix-flakes|flake]] from other modularly prepared nix derivations.

The default structure for a simple package such as the one I generated for [[nixvim]] is

```
flake.nix
pkg.nix
config/default.nix
```

# flake.nix

```nix
{
  description = "";

  
  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = inputs @ {flake-parts, ...}:
    flake-parts.lib.mkFlake {inherit inputs;} ({
      withSystem,
      flake-parts-lib,
      moduleWithSystem,
      ...
    }: {
      imports = [
        ./pkg.nix
      ];
      systems = ["x86_64-linux" "aarch64-darwin"];
      
      perSystem = {
        system,
        pkgs,
        self',
        lib,
        ...
      }: {
        formatter = pkgs.alejandra;
        devShells.default = pkgs.mkShell {
          nativeBuildInputs = [
            pkgs.alejandra
            self'.packages.<package_name>
          ];
        };
      };
    });
}
```

# pkg.nix
This file is a function, where `perSystem` is a function that takes some inputs and returns the per-system flake outputs. In my repo, I set it so that `package.default` takes a `config` module.

```nix
{
  inputs,
  self,
  ...
}: {
  perSystem = {
    inputs',
    self',
    pkgs,
    system,
    ...
  }: {
    packages.default = ...;

    checks.test = ...;
  };
}
```