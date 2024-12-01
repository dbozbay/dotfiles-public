# darwin.nix

{ pkgs, ... }: 

{
    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # List packages installed in system profile. To search by name, run:
    # $ nix-env -qaP | grep wget
    environment.systemPackages =
    [ pkgs.vim
    ];

    # Auto upgrade nix package and the daemon service.
    services.nix-daemon.enable = true;
    # nix.package = pkgs.nix;

    # JetBrains Mono for life
    fonts.packages = [
      (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];

    # Necessary for using flakes on this system.
    nix.settings.experimental-features = "nix-command flakes";
 
    # Create /etc/zshrc/ that loads the nix-darwin environment
    programs.zsh.enable = true;

    # Enable homebrew
    homebrew = {
      enable = true;
	  #    taps = [
	  #      # {
	  #        # name = "indirect/homebrew-tap";
	  # # clone_target = "https://github.com/indirect/homebrew-tap.git";
	  # # force_auto_update = true;
	  #      # }
	  #    ];
      casks = [
        # indirect/tap/ghostty
      ];
      onActivation.cleanup = "zap";
    };


    # Aliases for ALL shells
    # environment.shellAliases = 
    #   v = "nvim";
    # };
  
    # Enable touch ID for Sudo commands
    security.pam.enableSudoTouchIdAuth = true;

    # System default settings
    system.defaults = {
      dock = {
        autohide = true;
	autohide-delay = 0.0;
	autohide-time-modifier = 0.2;
	tilesize = 48;
	launchanim = false;
	static-only = false;
	showhidden = true;
	show-recents = false;
	show-process-indicators = true;
	orientation = "bottom";
	mru-spaces = false;
	persistent-apps = [
	  "/Applications/Safari.app"
	  "${pkgs.arc-browser}/Applications/Arc.app"
	  "${pkgs.kitty}/Applications/kitty.app"
	  "${pkgs.discord-ptb}/Applications/Discord PTB.app"
        ];
      };
      NSGlobalDomain = {
        AppleICUForce24HourTime = true;
	AppleInterfaceStyle = "Dark";
	KeyRepeat = 2;
      };
      finder.FXPreferredViewStyle = "clmv";
      loginwindow.GuestEnabled = false;
    };
    
    system.keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
    };

    # Set Git commit hash for darwin-version.
    # system.configurationRevision = self.rev or self.dirtyRev or null;  
    time.timeZone = "Europe/London";

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
	openssh.authorizedKeys.keys = [
	  "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGz22APsfP1C9A9RdW8vDe8ffb9HIiylnefDD/cyeXXr dbozbay"
	];
    };

    nix.settings.trusted-users = [
      "root"
      "dbozbay"
    ];
}
