{ vars, ... }:

{
  imports = [
    ./packages.nix
    ./modules/bundle.nix
    ./files.nix
  ];
   
  home = {
    username = vars.username;
    homeDirectory = "/Users/${vars.username}";
    stateVersion = "24.05";
    
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}


