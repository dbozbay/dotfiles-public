{  inputs, username, pkgs, ... }: let

  homeDir = "/Users/${username}";
  configDir = "${homeDir}/.config";
  flakeDir = "${homeDir}/nix";

in {

  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    
    ./packages.nix
    ./modules/default.nix
  ];

  programs.home-manager.enable = true;
 
  nixpkgs = {
    overlays = [
      inputs.neovim-nightly-overlay.overlays.default
    ];
    config = {
      allowUnfree = true;
    };
  };

  home = {
    username = "${username}";
    homeDirectory = homeDir;
    stateVersion = "24.05";

    sessionVariables = {
      EDITOR = "nvim";
      CXX = "clang++";
      XDG_CONFIG_HOME = configDir;
    };
      
    shellAliases = {
      ds = "darwin-rebuild switch --flake ${flakeDir}";
      dc = "darwin-rebuild check --flake ${flakeDir}";
      dg = "darwin-rebuild --list-generations";

      ll = "ls -l";
      v = "nvim";
      lg = "lazygit";
      as = "aerospace";
    };

    file = {
      "${configDir}/kitty/kitty.conf".source = ./files/kitty.conf;
      "${configDir}/ghostty/config".source = ./files/ghostty;
      "${configDir}/aerospace/aerospace.toml".source = ./files/aerospace.toml;
      # "${configDir}/yazi/theme.toml".source = ./files/yazi-catppuccin.toml; 
    };
  };
}

