{ config, pkgs, ... }:

{
  imports = [
  	./hyprland.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  nixpkgs.config.allowUnfree = true;
  home.username = "jburg54";
  home.homeDirectory = "/home/jburg54";
  
  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
    pkgs.fastfetch
    pkgs.kdePackages.kate
    pkgs.discord
    pkgs.btop
    pkgs.lutris
    pkgs.obs-studio
    pkgs.spotify
    pkgs.sweet
    pkgs.sweet-folders
    pkgs.lightly-qt
    pkgs.catppuccin-kde
    pkgs.catppuccin-papirus-folders
    pkgs.vinegar
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/jburg54/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "micro";
    #SHELL = "${pkgs.zsh}/bin/zsh";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.kitty = {
  	enable = true;
	#settings = {
  	#	background_opacity = 0.3;
  	#	background_blur = 1;
  	#};
  };

  programs.firefox.enable = true;

  programs.bash = {
  	enable = true;
  	shellAliases = {
  		osr = "sudo nixos-rebuild switch --flake /etc/nixos/#nixos";
  		cfghome = "sudo micro /etc/nixos/home.nix";
  		cfgnix = "sudo micro /etc/nixos/configuration.nix";
  		cfgfp = "sudo micro /etc/nixos/flatpak.nix";
  		cfgflake = "sudo micro /etc/nixos/flake.nix";
  		eza = "eza -l --header --git -T --hyperlink --icons";
  	};

  	#bashrcExtra = ''
  	#      # Custom colorful prompt
  	#      export PS1='\[\033[1;36m\]\u\[\033[0m\]@\[\033[1;36m\]\h\[\033[0m\]:\[\033[1;34m\]\w\[\033[0m\]\$ '
  	#    '';
  };

  #programs.starship = {
  #	enable = true;
  #};

  programs.powerline-go.enable = true;
  programs.eza.enable = true;
  
  #programs.zsh = {
  #	enable = true;
  #	shellAliases = {
  #		osr = "sudo nixos-rebuild switch --flake /etc/nixos/#nixos";
  #		ll = "ls -l";
  #	};
  #};
}
