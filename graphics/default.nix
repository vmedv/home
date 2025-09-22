{ pkgs, ... }:

{
  imports = [
    ./cursor
    # ./hypr
    ./eww.nix
    ./fuzzel.nix
    ./niri.nix
    ./waybar.nix
  ];
  home.packages = [
    pkgs.kdePackages.qtsvg
    pkgs.quickshell
  ];
}
