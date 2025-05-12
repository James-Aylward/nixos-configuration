{
  config,
  pkgs,
  ...
}: {

  programs.yazi = {
		enable = true;
		enableZshIntegration = true;
	}

  programs.fzf = {
		enable = true;
		enableZshIntegration = true;
  }

  programs.zoxide = {
		enable = true;
		enableZshIntegration = true;
  }

	programs.lazygit.enable = true;
	home.shellAliases = {
		lg = "lazygit";
	};

	# TODO colors for btop
	programs.btop = {
		enable = true;
	}

}
