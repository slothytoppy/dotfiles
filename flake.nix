# SPDX-FileCopyrightText: 2023 Jade Lovelace
#
# SPDX-License-Identifier: CC0-1.0

{
  inputs = {
    flakey-profile.url = "github:lf-/flakey-profile";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    nixgl.url = "github:nix-community/nixGL";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    flakey-profile,
    nixgl,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [nixgl.overlay];
      };
    in {
      packages.profile = flakey-profile.lib.mkProfile {
        inherit pkgs;
        pinned = {nixpkgs = toString nixpkgs;};
        paths = with pkgs; [
          vesktop discord
          (pkgs.nixgl.override {
            nvidiaVersion = "570.144";
            nvidiaHash = "sha256-wLjX7PLiC4N2dnS6uP7k0TI9xVWAJ02Ok0Y16JVfO+Y=";
          })
          .nixGLNvidia zellij zoxide nvim
        ];
      };
    });
}

