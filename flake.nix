{
  description = "My Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dotfiles = {
      url = "git+file:///home/blade/dotfiles"; # Replace with your dotfiles repo URL or local path
      flake = false; # or true if it's also a flake
    };
  };
  outputs = { self, nixpkgs, home-manager, dotfiles, ... }:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    homeConfigurations."blade" = home-manager.lib.homeManagerConfiguration {
      pkgs = pkgs;
      modules = [
        ./home.nix
      ];
    };
    dotfiles = dotfiles;
  };
}
