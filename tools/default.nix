{ pkgs, ... }:

{
  imports = [
    ./helix.nix
    ./wezterm.nix
    ./fish.nix
  ];
  
  home.packages = with pkgs; [
    telegram-desktop
    spotify
    obs-studio
    mpv
    chromium
    bitwarden
    obsidian
    qbittorrent
    lorien
    logseq
    lutris
  ];
}
