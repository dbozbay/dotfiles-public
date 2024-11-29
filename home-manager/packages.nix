{ pkgs, ... }: {

  home.packages = with pkgs; [
    # Utils
    kitty
    fzf
    eza
    fd
    ripgrep
    yazi
    lazygit
    ghq

    # GUIs
    arc-browser
    discord-ptb
  ];
}

