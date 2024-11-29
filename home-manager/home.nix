{ username, ... }:

{
  imports = [
    ./packages.nix
    ./modules/bundle.nix
    ./files.nix
  ];
   
  home = {
    username = username;
    homeDirectory = "/Users/${username}";
    stateVersion = "24.05";
    
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}


