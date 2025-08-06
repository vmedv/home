{ pkgs,  ... }:

{
  imports = [
    ./helix.nix
    ./ghostty.nix
    ./wezterm.nix
    ./blesh.nix
    ./fish.nix
    ./zellij.nix
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
  ];
}
