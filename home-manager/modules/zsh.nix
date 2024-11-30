{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
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
      as = "aerospace";
     };
  };
}

