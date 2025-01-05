---
title: Reproducible Python development environment
tags:
    - python
    - nix
    - blog
---

I have struggled with making a reproducible python development environment for a while, but I think I have now found the proper way.

I am stubborn enough that I want to make sure I use nix flakes, so let's start by entering a new folder and generating a flake. The flake will use [devenv](https://devenv.sh/) to generate the environment with [flake-parts](https://flake.parts/).

```nix
{
  description = "Python development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/24-11";
    devenv = {
      url = "github:cachix/devenv";
    };
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
    };
  };

  outputs = {
    self,
    nixpkgs,
    devenv,
    flake-parts,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;}
    {
      imports = [
        inputs.devenv.flakeModule  # Import the devenv flake module as per the doc.
      ];
      systems = nixpkgs.lib.systems.flakeExposed; # Get a reference to the systems.
      perSystem = {
        config,
        self',
        inputs',
        pkgs,
        system,
        ...
      }: {
        formatter = pkgs.alejandra; # Set the nix formatter to alejandra
        devenv.shells.default = {
          imports = [./devenv.nix]; # Generate a shell from the devenv.nix module.
        };
      };
    };
}
```

Let's study it part by part.

First, we add some basic description of the flake, which is just a simple text string.

Then we add the inputs. These will be cached by nix (symlinks all the way) so it will be fast to reload the shell. Finally we set the outputs.

In the outputs, we are basically only adding a formatter and a default shell, which uses devenv.

Let's make another file called `devenv.nix` and generate a reasonably good python environment.

```nix
{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
  packages = [ pkgs.git ];
  languages.python.enable = true;
  languages.python.uv.enable = true;
  languages.python.uv.sync.enable = true;
  languages.python.uv.sync.allExtras = true;
  languages.python.venv.enable = true;

  scripts.pytest.exec = ''
    pytest
  '';

  pre-commit = {
    hooks = {
      ruff.enable = true;
      ruff-format.enable = true;
    };
  };
  enterTest = ''
    pytest
  '';
}
```

With all of this in mind, the last step is to generate a `.envrc` file using `nix-direnv`.

```
if ! has nix_direnv_version || ! nix_direnv_version 3.0.6; then
  source_url "https://raw.githubusercontent.com/nix-community/nix-direnv/3.0.6/direnvrc" "sha256-RYcUJaRMf8oF5LznDrlCXbkOQrywm0HDv1VjYGaJGdM="
fi
use flake . --no-pure-eval
```

And now it's ready! Whenever we move into the folder, we will have an environment that we can manage with `uv`, with all the necessary tools. Out virtual environment will be defined as default in `.devenv/state/venv`, but we don't need to worry about that.

Now you can test it quickly. Let's, for example, add `pydantic` to our new environment.

```bash
uv add pydantic
uv pip list
```

```
Using Python 3.12.8 environment at: .devenv/state/venv
Package            Version    Editable project location
------------------ ---------- -------------------------
annotated-types    0.7.0
certifi            2024.12.14
charset-normalizer 3.4.1
devto-api          0.1.0      /home/alejandro/devto.py
idna               3.10
loguru             0.7.3
pydantic           2.10.4
pydantic-core      2.27.2
requests           2.32.3
typing-extensions  4.12.2
urllib3            2.3.0
```
