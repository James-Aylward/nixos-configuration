{
  config,
  pkgs,
  ...
}: {
	programs.git = {
		enable = true;
		userEmail = "james.michael.aylward@gmail.com";
		userName = "James Aylward";
	};

	programs.lazygit.enable = true;
	programs.gh.enable = true;

	home.shellAliases = {
		lg = "lazygit";
	};

}
