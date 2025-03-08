{
  description = "My Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    homeConfigurations."blade" = home-manager.lib.homeManagerConfiguration {
      pkgs = pkgs;
      modules = [
#        /home/blade/.config/home-manager/home.nix
        ./home.nix
      ];
#      extraSessionVariables.HOME_DIR = "/home/blade";
    };
  };
}
