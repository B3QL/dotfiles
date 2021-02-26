{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "b3ql";
  home.homeDirectory = "/home/b3ql";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.05";

  # Custom config
  news.display = "silent";

  home.packages = with pkgs; [
    discord
    bitwarden
    kbfs
    keybase
    keybase-gui
    spotify
    gimp
    emacs
    ripgrep
   
    # A simple, fast and user-friendly alternative to 'find' 
    # https://github.com/sharkdp/fd
    fd 

    # Fonts
    fira-code
    fira-code-symbols
    source-code-pro
  ];
  
  programs.git = {
    enable = true;
    userName = "Bartłomiej Kurzeja";
    userEmail = "bartlomiej@kurzeja.it";
  };

  programs.neovim = {
    enable = true;
    vimAlias = true;
    vimdiffAlias = true;
  };

  programs.bash = {
    enable = true;
  };

  # Register applications icon
  # https://github.com/nix-community/home-manager/issues/1439#issuecomment-714830958
  xdg.enable=true;
  xdg.mime.enable=true;
  targets.genericLinux.enable=true;

  home.sessionVariables = {
    PAGER = "less";
    EDITOR = "vim";
    XDG_DATA_DIRS = "$HOME/.nix-profile/share:$HOME/.share:\${XDG_DATA_DIRS:-/usr/local/share/:/usr/share/}";
    DOOMLOCALDIR = "$HOME/.doom.d/.local";
    PATH = "$HOME/.emacs.d/bin:$HOME/.poetry/bin:$PATH";
  };

  home.file.".emacs.d" = {
    source = builtins.fetchGit {
      url = "https://github.com/hlissner/doom-emacs";
      ref = "develop";
    };
    recursive = true;
  };
}
