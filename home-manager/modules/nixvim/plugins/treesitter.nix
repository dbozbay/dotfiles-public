{
  programs.nixvim = {
    plugins = {
      treesitter = {
        enable = true;
        settings = {
          auto_install = false;
          # indent = true;
          ensure_installed = [
            "nix"
            "python"
            "cpp"
            "lua"
            "toml"
            "json"
            "rust"
          ];
        };
      };
      
      # TODO: fix this
      # treesitter-textobjects = {
      #   enable = true;
      #   select = {
      #     enable = true;
      #     keymaps = {
      #     };
      #   };
      # };
    };
  };
}




