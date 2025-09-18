{ pkgs, ... }:

{
  imports = [
    ./helix.nix
    ./zed.nix
    ./ghostty.nix
    ./wezterm.nix
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
