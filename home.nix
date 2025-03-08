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

  # Set PATH to match Bash's PATH
  home.sessionVariables = {
    PATH = "${pkgs.coreutils}/bin:/home/blade/.nix-profile/bin:/home/blade/.local/bin:/home/blade/.nix-profile/bin:/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:/home/blade/.nix-profile/bin:/nix/var/nix/profiles/default/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/opt/nvim-linux-x86_64/bin:/home/blade/downloads/zig-linux-x86_64-0.14.0-dev.3388+e0a955afb";
  };

  programs.home-manager.enable = true;
}
