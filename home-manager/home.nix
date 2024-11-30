{  inputs, username, ... }: let

  homeDir = "/Users/${username}";
  configDir = "${homeDir}/.config";
  flakeDir = "${homeDir}/nix";

in {

  imports = [
    ./packages.nix
    ./modules/bundle.nix
    inputs.nixvim.homeManagerModules.nixvim
  ];

  nixpkgs = {
    overlays =  [
      inputs.neovim-nightly-overlay.overlay
    ];
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
      dswitch = "darwin-rebuild switch --flake ${flakeDir}";
      dcheck = "darwin-rebuild check --flake ${flakeDir}";
      dbuild = "darwin-rebuild build --flake ${flakeDir}";
      dact = "darwin-rebuild activate --flake ${flakeDir}";
      dgens = "darwin-rebuild --list-generations";

      ll = "ls -l";
      v = "nvim";
      lg = "lazygit";
      as = "aerospace";
    };

    file = {
      "${configDir}/kitty/kitty.conf".source = ./files/kitty.conf;
      "${configDir}/ghostty/config".source = ./files/ghostty;
      "${configDir}/aerospace/aerospace.toml".source = ./files/aerospace.toml;
      "${configDir}/yazi/theme.toml".source = ./files/yazi-catppuccin.toml; 
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

