{ config, pkgs, ... }:

{
  imports = [
   ./zsh
   ./direnv
   ./kitty
   # ./nvim
  ];
  home.username = "zero";
  home.homeDirectory = "/home/zero";

  home.file = {
    ".p10k.zsh".source = ./zsh/.p10k.zsh; 
  };

  fonts.fontconfig.enable = true;
  # Basic git config
  programs.git = {
    enable = true;
    userName = "zerodetail";
    userEmail = "zerodetail@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
 programs.neovim = {
    enable = true;

    viAlias = true;
     vimAlias = true;
     vimdiffAlias = true;
  }; 
  xdg.configFile.nvim.source = ./nvim;

  # packages that should be installed to the user profile.
  home.packages = with pkgs; [
    
    ## Better Alternatives
    zoxide # Smart cd - https://github.com/ajeetdsouza/zoxide
    bat # Syntax highlighted cat - https://github.com/sharkdp/bat
    exa # modern ls w/ git support - https://the.exa.website/
    lsd # better ls that can be aliased with ls - https://github.com/lsd-rs/lsd
    du-dust # better disk usage - https://github.com/bootandy/dust
    ripgrep # Better grep - https://github.com/BurntSushi/ripgrep
    fd # better find - https://github.com/sharkdp/fd
    kitty


    ## Extra cli commands
    thefuck # fix your command typos https://github.com/nvbn/thefuck
    fzf # Fuzzy finder - https://github.com/junegunn/fzf
    neofetch  
    gdb # Code Debugging 
    zip
    unzip
    iftop # top for network connections
    tree
    wget
    xclip
    ranger # vim inspired file manager - https://github.com/ranger/ranger
    gnupg
    git-repo # android AOSP git mgmt tool
    firefox
    chromium 
    exercism

    ## Languages
    python3
    gcc # C/C++ compilation
    go
    docker
    docker-compose
    nodejs_latest

    ## Nerd Font
    (nerdfonts.override { fonts = [ "FiraCode"]; })
  ];

  home.stateVersion = "23.05";
  programs.home-manager.enable = true;
}
