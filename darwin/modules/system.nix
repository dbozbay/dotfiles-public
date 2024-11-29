{ pkgs, ... }: {
  
  system = {
    defaults = {
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
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
    };
  };

  # Enable touch ID for Sudo commands
  security.pam.enableSudoTouchIdAuth = true; 
}
        

