{
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
    };
    brews = [
      "uv"
    ];
    casks = [
      "the-unarchiver"
      "spotify"
    ];
    masApps = {
      "Ghostery" = 6504861501;
    };
  };
}
