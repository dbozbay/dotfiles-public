# darwin.nix

{ pkgs, ... }: 

{
    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # List packages installed in system profile. To search by name, run:
    # $ nix-env -qaP | grep wget
    environment.systemPackages =
    [ pkgs.neovim
      pkgs.arc-browser
      pkgs.kitty
    ];

    # Auto upgrade nix package and the daemon service.
    services.nix-daemon.enable = true;
    # services.karabiner-elements.enable = true;
    # nix.package = pkgs.nix;

    # JetBrains Mono for life
    fonts.packages = [
      (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];

    # Necessary for using flakes on this system.
    nix.settings.experimental-features = "nix-command flakes";

    # Create /etc/zshrc/ that loads the nix-darwin environment
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      enableSyntaxHighlighting = true;
    };

    # Aliases for ALL shells
    environment.shellAliases = 
    let 
      flakeDir = "~/nix";
    in {
      darwin-rb = "darwin-rebuild switch --flake ${flakeDir}";
      darwin-flake = "nvim ${flakeDir}/flake.nix";

      ll = "ls -l";
      v = "nvim";
    };

    # Enable touch ID for Sudo commands
    security.pam.enableSudoTouchIdAuth = true;

    # System default settings
    system.defaults = {
      dock.autohide = true;
      dock.mru-spaces = true;
      dock.persistent-apps = [
	  "/System/Applications/Safari.app"
	  "${pkgs.arc-browser}/Applications/Arc.app"
	  "${pkgs.kitty}/Applications/kitty.app"
      ];
      finder.FXPreferredViewStyle = "clmv";
      loginwindow.GuestEnabled = false;
      NSGlobalDomain.AppleICUForce24HourTime = true;
      NSGlobalDomain.AppleInterfaceStyle = "Dark";
      NSGlobalDomain.KeyRepeat = 2;
    };

    # Set Git commit hash for darwin-version.
    # system.configurationRevision = self.rev or self.dirtyRev or null;

    # Used for backwards compatibility, please read the changelog before changing.
    # $ darwin-rebuild changelog
    system.stateVersion = 5;

    # The platform the configuration will be used on.
    # TODO: Change to "aarch64-darwin" for Apple Silacon
    nixpkgs.hostPlatform = "x86_64-darwin";
    
    # TODO: Change username 
    users.users.dbozbay = {
        name = "dbozbay";
        home = "/Users/dbozbay";
    };
}
