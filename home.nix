# home.nix

{ config, pkgs, ... }:

let
  home = builtins.getEnv "HOME";
  xdg_configHome = "${home}/.config";
in
{

  # TODO please change the username & home directory to your own
  # home.username = "dbozbay";
  # home.homeDirectory = "/home/dbozbay";

  # Home Manager needs a bit of information about you and the paths it should
  # manage.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    kitty
    fzf
    eza
    fd
    ripgrep
    tmux
    yazi
    lazygit
    ghq
    
    # GUIs
    arc-browser
    discord-ptb
    # nu
  ];

  # Create /etc/zshrc/ that loads the nix-darwin environment
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    shellAliases = 
    let 
      flakeDir = "~/nix";
    in {
      switch = "darwin-rebuild switch --flake ${flakeDir}";
      flake = "nvim ${flakeDir}/flake.nix";

      ll = "ls -l";
      v = "nvim";
      lg = "lazygit";
     };
  };

  # git of course 
  programs.git = {
    enable = true;
    userName = "dbozbay";
    userEmail = "107803920+dbozbay@users.noreply.github.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  # starship - an customizable prompt for any shell
  programs.starship = {
    enable = true;
    # custom settings
    settings = {
      add_newline = false;
      line_break.disabled = true;
    };
  };

  # neovim - the GOAT editor bro
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    plugins = with pkgs.vimPlugins; [
      rose-pine
      telescope-nvim
    ];
    extraLuaConfig = 
      ''
        vim.g.mapleader = " "
	vim.opt.number = true
	vim.opt.relativenumber = true
	vim.termguicolors = true
      '';
  };


  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;
    "${xdg_configHome}/kitty/kitty.conf".source = ./kitty.conf;
    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/davish/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  #home.sessionVariables = {
   # xdg_configHome = "~/.config";
  #};

  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

