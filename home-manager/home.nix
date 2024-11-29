{ config, pkgs, lib, vars, ... }:

let 
  user = "${vars.user}";
in
{
  imports = [
    ./packages.nix
    ./modules/bundle.nix
    ./files.nix
  ];
   
  home = {
    username = "${user}";
    homeDirectory = "/Users/${user}";
    stateVersion = "24.05";
    
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}


