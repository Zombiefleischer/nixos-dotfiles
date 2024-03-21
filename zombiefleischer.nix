{ lib, config, pkgs, ... }:

let
	cfg = config.main-user;
in
{
	options.main-user = {
		enable = lib.mkEnableOption "enable user module";

		userName = lib.mkOption {
			default = "mainuser";
			description = ''
				username
			'';
		};

		userDescription = lib.mkOption {
			default = "main user";
			description = ''
				user description
			'';
		};
	};

	config = lib.mkIf cfg.enable {
		users.users.${cfg.userName} = {
			isNormalUser = true;
			description = "${cfg.userDescription}";
			extraGroups = ["networkmanager" "wheel"];
			shell = pkgs.zsh;
		};
	};	
};
