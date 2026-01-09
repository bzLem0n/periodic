{
  inputs,
  config,
  pkgs,
  lib,
  ...
}:
{
  imports = [ inputs.self.nixosModules.sound ];

  environment.plasma6.excludePackages = with pkgs; [
    pkgs.kdePackages.khelpcenter
    pkgs.kdePackages.elisa
    pkgs.kdePackages.gwenview
  ];

  environment.sessionVariables = {
    MOZ_USE_XINPUT2 = "1";
  };

  environment.systemPackages = with pkgs; [
    #    calibre
    deluge
    neovide

    kdePackages.ark
    kdePackages.discover
    kdePackages.filelight
    kdePackages.kate
    kdePackages.kcalc
    kdePackages.kcharselect
    kdePackages.kcolorchooser
    kdePackages.konversation
    kdePackages.krdc
    kdePackages.okular
    krename
    krita
    lxqt.lximage-qt
    vlc
    xscreensaver

    libreoffice-qt
    hunspell
    hunspellDicts.en_CA
    hunspellDicts.en_CA-large

    ntfs3g

    ffmpegthumbnailer
    kdePackages.ffmpegthumbs
    libdbusmenu-gtk2
    libdbusmenu-gtk3
  ];

  nixpkgs.config.permittedInsecurePackages = [ "imagemagick-6.9.12-68" ];

  fonts.packages = with pkgs; [
    liberation_ttf
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    nerd-fonts.liberation
    nerd-fonts.open-dyslexic
  ];

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Enable = "Source,Sink,Media,Socket";
          Privacy = "device";
          JustWorksRepairing = "always";
#          Class = "0x000100";
          FastConnectable = "true";
        };
      };
    };

    graphics = {
      enable32Bit = true;
      enable = true;
    };
  };

  programs = {
    kdeconnect.enable = true;
    virt-manager.enable = true;

    firefox = {
      enable = true;
      languagePacks = [ "en-CA" ];
    };
  };

  services = {
    flatpak.enable = true;
    printing.enable = true;

    xserver.enable = true;
    libinput.enable = true;
    desktopManager.plasma6.enable = true;

    displayManager = {
      sddm.enable = true;
      autoLogin = {
        enable = true;
        user = "kcrook";
      };
    };

    xrdp = {
      enable = true;
      defaultWindowManager = "startplasma-x11";
      openFirewall = true;
    };
  };

  xdg = {
    menus.enable = true;
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
    };
  };
}
