{
  programs.zsh = {
    enable = true;
    
    # We are turning these settings off here (at system) level and turning them on at user level. Running both slows the prompt!
    enableBashCompletion = false;
    enableCompletion = false;
    enableGlobalCompInit = false;
  };
}
