{ pkgs, ... }:

{
  imports = [
    ./cursor
    ./hypr
    ./eww.nix
    ./fuzzel.nix
    ./ashell.nix
    ./niri.nix
  ];
  home.packages = [
    pkgs.kdePackages.qtsvg
    pkgs.quickshell
  ];
}
