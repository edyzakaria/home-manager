{ config, pkgs, ... }:

{
  home.username = "blade";
  home.homeDirectory = "/home/blade";
  home.stateVersion = "24.05";
  home.packages = [
    pkgs.hello
    pkgs.vim
    pkgs.direnv
    pkgs.sshs
    pkgs.glow
    pkgs.nushell
    pkgs.bat
    pkgs.carapace
    pkgs.cargo
  ];

  home.file = {
    ".config/nvim".source = "${dotfiles}/nvim"; # Reference dotfiles
  };

  programs.home-manager.enable = true;
}
