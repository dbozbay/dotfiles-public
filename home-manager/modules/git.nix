{ config, vars,... }: 

  let 
    home = builtins.getEnv "HOME";  # Set 'home' to the value of the 'HOME' environment variable
    devDir = "${home}/Dev";
  in
  {
    programs.git = {
      enable = true;
      userName = "dbozbay";
      userEmail = "107803920+dbozbay@users.noreply.github.com";
      ignores = import ../files/gitignore_global.nix;
      extraConfig = {
        init.defaultBranch = "main";
        core.editor = "nvim";
        color.ui = true;
        ghq.root = "/Users/${vars.user}/Dev/ghq";  # Use the 'home' variable for the git config
      };
    };
  }

