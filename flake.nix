{
  description = "My Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dotfiles = {
      # url = "git@github.com:edyzakaria/dotfiles.git"; # Replace with your dotfiles repo URL or local path
      url = "path:/home/blade/dotfiles";
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
      # pkgs = pkgs;
      inherit pkgs;
      modules = [ ./home.nix ];
      extraSpecialArgs = { inherit dotfiles; }; # Pass dotfiles as a special argument
    };
  };
}
