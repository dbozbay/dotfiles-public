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
          incremental_selection = {
           enable = true;
           keymaps = {
             initSelection = "<C-space>";
             nodeIncremental = "<C-space>";
             nodeDecremental = "<bs>";
           };
          };
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




