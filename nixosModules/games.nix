{ inputs, config, pkgs, lib, ... }: {
  environment.systemPackages = with pkgs; [
    steam-run
    protonup-qt
  ];

  programs = {
    gamescope = {
      enable = true;
      capSysNice = true;
    };
    steam = {
      enable = true;
      gamescopeSession.enable = true;
      extraPackages = with pkgs; [
        gamescope
        mangohud
      ];
    };
  };

  # services = { };
}
