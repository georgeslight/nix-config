{
  config,
  pkgs,
  pkgs-unstable,
  ...
}:

{
  programs.zsh = {
    enable = true;
    package = pkgs.zsh;

    # Add Powerlevel10k theme
    initContent = ''
      # Load p10k theme
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      # Disable p10k configuration wizard
      typeset -g POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
      # Load p10k config if it exists
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

      # Keybindings
      bindkey '^[[1;5C' forward-word        # Ctrl+Right Arrow
      bindkey '^[[1;5D' backward-word       # Ctrl+Left Arrow
      bindkey '^[[3;5~' kill-word           # Ctrl+Delete
      bindkey '^H' backward-kill-word       # Ctrl+Backspace
    '';

    history = {
      size = 5000; # Number of history lines to keep
      path = "${config.home.homeDirectory}/.zsh_history";
      append = true; # If set, zsh sessions will append their history list to the history file, rather than replace it
      findNoDups = true; # Do not display a line previously found in the history file
      ignoreAllDups = true; # If a new command line being added to the history list duplicates an older one, the older command is removed from the list (even if it is not the previous event)
      ignoreSpace = true; # Do not enter command lines into the history list if the first character is a space
      share = true; # Share command history between zsh sessions
      saveNoDups = true; # Do not write duplicate entries into the history file
      ignoreDups = true; # Do not enter command lines into the history list if they are duplicates of the previous event
    };
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;

    shellAliases = {
      ls = "eza --long --color=always --icons=always";
      cat = "bat --paging=never";
      cd = "z";
      ld = "lazydocker";
      lg = "lazygit";
      TODO = "rg -p TODO | bat";
      ihx = "hx $(fzf --preview='bat --color=always {}')";
      y = "yazi";
    };
  };

  home.packages = with pkgs; [
    zoxide
    fzf
    zsh-powerlevel10k
    meslo-lgs-nf # Meslo Nerd Font patched for Powerlevel10k
    eza
    bat
  ];

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.fzf.enableZshIntegration = true;
}
