# isabel roses' nur

[![Build and populate cache](https://github.com/isabelroses/nur/actions/workflows/build.yml/badge.svg)](https://github.com/isabelroses/nur/actions/workflows/build.yml)

## packages

| Packages                             | Note             | Version    |
| ------------------------------------ | ---------------- | ---------- |
| [`catppuccin-hyprland`][catppuccin-hyprland]                  |                  | 99a88fd    |
| [`bellado`][bellado]                              |                  | 5a570f4    |

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
