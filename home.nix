{ pkgs, ... }:

{
  home.stateVersion = "26.05";

  home.username = "trevorswan";
  home.homeDirectory = "/home/trevorswan";

  home.packages = with pkgs; [
    git
    git-lfs
    fossil
    wget
    zip

    ripgrep
    fd
    dust
    eza
    bottom
    zoxide
    rip2
    fzf

    nixd
    nil
    nixfmt

    poppler-utils
    imagemagick
    zstd
  ];

  programs = {
    fish = {
      enable = true;

      interactiveShellInit = ''
        set -g fish_greeting ""
        if not set -q fish_key_bindings || test "$fish_key_bindings" = ""
            set -g fish_key_bindings fish_default_key_bindings
            end

        direnv hook fish | source
        zoxide init fish | source
      '';

      shellAliases = {
        ls = "eza";
        cd = "z";
        du = "dust";
        nexus = "TERM=xterm-256color ssh nexus";
        eecs = "TERM=xterm-256color ssh eecs";
        nd = "nix develop --command fish";
        ndi = "nix develop --impure --command fish";
        rgv = "rg --vimgrep";
      };

      functions = {
        fish_prompt.body = builtins.readFile ./fish_prompt.fish;
        addpaths.body = builtins.readFile ./addpaths.fish;
        removepaths.body = builtins.readFile ./removepaths.fish;
      };
    };

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    gh = {
      enable = true;
      settings = {
        git_protocol = "https";
        editor = "nvim";
        prompt = "enabled";
      };
    };
  };
}
