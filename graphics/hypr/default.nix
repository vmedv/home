{ pkgs, config, colorMode, ... }:

{
  imports = [
    ./hyprlock.nix
    ./hyprpaper.nix
  ];
  wayland.windowManager.hyprland = import ./hyprland.nix { inherit pkgs config; };
  services.hypridle = import ./hypridle.nix;

  home.packages = with pkgs; [
    hyprshot
    hyprpolkitagent
    socat
  ];
}
