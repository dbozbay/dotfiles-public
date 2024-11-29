{ pkgs, username, ... }: {

  programs.zsh.enable = true;

  users.users.${username} = {
    name = "${username}";
    home = "/Users/${username}";
    createHome = true;
    shell = pkgs.zsh;
  };
}

