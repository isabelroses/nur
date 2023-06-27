# isabel roses' nur

[![Build and populate cache](https://github.com/nekowinston/nur/actions/workflows/build.yml/badge.svg)](https://github.com/nekowinston/nur/actions/workflows/build.yml)
[![Cachix Cache](https://img.shields.io/badge/cachix-nekowinston-blue.svg)](https://nekowinston.cachix.org)

## packages

| Packages                             | Note             | Version    |
| ------------------------------------ | ---------------- | ---------- |
| [`catppuccin-hyprland`][catppuccin-hyprland]                  |                  | 99a88fd    |
| [`bellado`][bellado]                              |                  | 61f3603    |

## Usage

```nix
{
  inputs = {
    nur.url = "github:nix-community/NUR";
    isabelroses-nur.url = "github:isabelroses/nur";
  };

  outputs = {
    self,
    nixpkgs,
    nur,
    isabelroses-nur,
    ...
  }: let
    overlays = [
      # nur overlay
      (final: prev: {
        nur = import nur {
          nurpkgs = prev;
          pkgs = prev;
          repoOverrides = {
            # other repo overrides
            isabelroses = isabelroses-nur.packages.${prev.system};
          };
        };
      })
    ];
  in {
    system = "x86_64-linux";

    modules = [
      ({config, ...}: {
        config = {
          nixpkgs.overlays = [overlays];
        };
      })
    ];
  };
}
```

[catppuccin-hyprland]: https://github.com/catppuccin/hyprland
[bellado]: https://github.com/isabelroses/bellado
