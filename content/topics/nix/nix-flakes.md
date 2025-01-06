Resources:
- [Zero to Nix](https://zero-to-nix.com/concepts/flakes/)

A nix flake is a directory containing, at least

```
flake.nix
flake.lock
```

You can create a flake, and a template, by running `nix flake init` in a folder.
A flake **outputs expressions** from its inputs

```nix
{
  inputs = {
    nixpkgs.url = "nixpkgs";
  };

  outputs = { self, nixpkgs }: {
    # Define outputs here
  };
}
```



