{ config, username, useremail,... }: 

  let 
    home = builtins.getEnv "HOME";  # Set 'home' to the value of the 'HOME' environment variable
    devDir = "${home}/Dev";
  in
  {
    programs.git = {
      enable = true;
      userName = username;
      userEmail = useremail;
      ignores = import ../files/gitignore_global.nix;
      extraConfig = {
        init.defaultBranch = "main";
        core.editor = "nvim";
        color.ui = true;
        ghq.root = "/Users/${username}/Dev/ghq";  # Use the 'home' variable for the git config
      };
      aliases = {
        g = "git";
        co = "checkout";
	ga = "git add";
	gc = "git commit";
	gp = "git push";
      };
    };
  }

