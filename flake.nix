{
  description = "Home Manager configuration by vmedv";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    zen.url = "github:0xc000022070/zen-browser-flake";
    ashell.url = "github:MalpenZibo/ashell";
    nix-colors.url = "github:misterio77/nix-colors";
    home-manager.url = "github:nix-community/home-manager/master";
    zed.url = "github:chaotic-cx/nyx";
    niri.url = "github:sodiboo/niri-flake";
  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      nix-colors,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      homeConfigurations."vmedv" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit inputs nix-colors; };
        modules = [ ./home.nix ];
      };
    };
}
