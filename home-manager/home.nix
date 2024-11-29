{ config, pkgs, username, nixvim, ... }:

{

  home = {
    username = "${username}";
    homeDirectory = "/Users/${username}";
    stateVersion = "24.05";
    
  };

  imports = [
    ./packages.nix
    ./modules/bundle.nix
    ./files.nix
    nixvim.homeManagerModules.nixvim
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}


