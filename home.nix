{ config, pkgs, ... }:

{
  home.username = "blade";
  home.homeDirectory = "/home/blade";
  home.stateVersion = "24.05";
  home.packages = [
    pkgs.hello
    pkgs.nushell
  ];

  programs.home-manager.enable = true;
}
