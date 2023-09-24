{ config, pkgs, inputs, ... }:

{
  imports = [
   ./zsh
   ./direnv
   ./kitty
   ./rofi
   # ./waybar
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
    # kitty


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

    thunderbird
    mako
    wl-clipboard
    rofi
    nil
  ];

  home.stateVersion = "23.05";
  programs.home-manager.enable = true;

  wayland.windowManager.sway = {
    enable = true;
    package = pkgs.swayfx;
    wrapperFeatures.gtk = true;
    wrapperFeatures.base = true;

    config = {
      window.titlebar = false;
      terminal = "kitty";
      menu = "rofi";
      bars = [{ command = "waybar"; }];
      output = {
        "*".background = "/etc/background.png fill";
        "Virtual-1" = {
          mode = "2560x1440@60Hz";
        };
      };
      gaps = {
        outer = 0;
        inner = 15;
      };

      modifier = "Mod4";
      keybindings = let 
        MOD = config.wayland.windowManager.sway.config.modifier;
      in {
        "${MOD}+b" = "exec firefox";
        "${MOD}+Return" = "exec kitty";
        "${MOD}+q" = "kill";
        "${MOD}+d" = "exec ~/.config/rofi/launcher.sh";

        ## Shift focus
        "${MOD}+h" = "focus left";
        "${MOD}+j" = "focus down";
        "${MOD}+k" = "focus up";
        "${MOD}+l" = "focus right";

        ## Move Window
        "${MOD}+Shift+h" = "move left";
        "${MOD}+Shift+j" = "move down";
        "${MOD}+Shift+k" = "move up";
        "${MOD}+Shift+l" = "move right";

        ## Workspaces
        "${MOD}+1" = "workspace number 1";
        "${MOD}+2" = "workspace number 2";
        "${MOD}+3" = "workspace number 3";
        "${MOD}+4" = "workspace number 4";
        "${MOD}+5" = "workspace number 5";
        "${MOD}+6" = "workspace number 6";
        "${MOD}+7" = "workspace number 7";
        "${MOD}+8" = "workspace number 8";
        "${MOD}+9" = "workspace number 9";
        "${MOD}+0" = "workspace number 0";

        "${MOD}+Shift+1" = "move container to workspace number 1";
        "${MOD}+Shift+2" = "move container to workspace number 2";
        "${MOD}+Shift+3" = "move container to workspace number 3";
        "${MOD}+Shift+4" = "move container to workspace number 4";
        "${MOD}+Shift+5" = "move container to workspace number 5";
        "${MOD}+Shift+6" = "move container to workspace number 6";
        "${MOD}+Shift+7" = "move container to workspace number 7";
        "${MOD}+Shift+8" = "move container to workspace number 8";
        "${MOD}+Shift+9" = "move container to workspace number 9";
        "${MOD}+Shift+0" = "move container to workspace number 0";

        ## Toggle Splitting
        "${MOD}+n" = "split horizontal";
        "${MOD}+v" = "split vertical";

        ## Fullscreen & Floating
        "${MOD}+F" = "fullscreen toggle";
        "${MOD}+Shift+F" = "floating toggle";
        "${MOD}+Space" = "focus mode_toggle";

        ## Resize
        "${MOD}+R" = "mode resize";

        ## Reload & Exit
        "${MOD}+Shift+R" = "reload";
        "${MOD}+Ctrl+Shift+E" = "exit";
      };
    };
  extraConfig = ''

    default_dim_inactive 0.1
    corner_radius 5
    shadows enable
    blur_radius 7
    blur_passes 4
  '';
  };
}
