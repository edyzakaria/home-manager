{ config, pkgs, dotfiles, ... }:

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
    ".config/carapace".source = "${dotfiles}/carapace";
    ".config/nushell".source = "${dotfiles}/nushell";
  };

  programs.home-manager.enable = true;
}
