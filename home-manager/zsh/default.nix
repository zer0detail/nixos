{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;

    initExtra = ''
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
      eval $(thefuck --alias)
    '';
    oh-my-zsh = {
      enable = true;
      plugins = [
        "docker"
        "git"
        "git-flow"
        "git-prompt"
        "gitignore"
        "node"
        "npm"
        "pass"
        "screen"
        "sudo"
        "systemd"
        "vi-mode"
        "adb"
        "aliases"
        "cp"
        "direnv"
        "docker-compose"
        "docker-machine"
        "dotenv"
        "fzf"
        "git-extras"
        "gitignore"
        "history"
        "man"
        "pip"
        "poetry"
        "pipenv"
        "python"
        "ripgrep"
        "rust"
        "vim-interaction"
        "zoxide"
        "zsh-interactive-cd"
        "zsh-navigation-tools"
      ];

    };
      shellAliases = {
        icat = "kitty +kitten icat";
        s = "kitty +kitten ssh";
        cat = "bat --paging=never";
        catl = "bat";
        cd = "z";
        l = "lsd";
        ll = "lsd -l";
        lll = "lsd -lah";
        f = "fdfind";
        du = "dust";
      };
      zplug = {
        enable = true;
        plugins = [{
          name = "romkatv/powerlevel10k";
          tags = [ "as:theme" "depth:1"];
        }];
      };
  };
}
