{ config, lib, ... }:
let
  inherit (lib) mkEnableOption mkOption types;

  cfg = config.modules.programs;
in
{
  imports = [ ./defaults.nix ];

  options.modules.programs = {
    # For programs that are not exactly limited to cli, tui or gui
    agnostic = {
      editors = {
        neovim.enable = mkEnableOption "Neovim editor" // { default = true; };
        vscode.enable = mkEnableOption "VScode editor" // {
          default = cfg.gui.enable;
        };
        micro.enable = mkEnableOption "Micro editor";
      };
    };

    cli = {
      enable = mkEnableOption "Enable CLI programs" // { default = true; };
      modernShell.enable =
        mkEnableOption "Enable programs for a more modern shell" // {
          default = true;
        };
    };

    tui.enable = mkEnableOption "Enable TUI programs" // { default = true; };

    gui = {
      enable = mkEnableOption "Enable GUI programs" // { default = true; };

      okular.enable =
        mkEnableOption "Enable okular, the universal document reader";
      discord.enable = mkEnableOption "Enable the discord client" // {
        default = cfg.gui.enable;
      };

      kdeconnect = {
        enable = mkEnableOption "Enable kdeconnect";
        indicator.enable = mkEnableOption "Enable kdeconnect indicator";
      };

      launchers = {
        fuzzel.enable = mkEnableOption "Enable fuzzel launcher"; #TODO
        wofi.enable = mkEnableOption "Enable wofi launcher";
      };

      bars = {
        ags.enable = mkEnableOption "Enable ags bar/launcher";
        waybar.enable = mkEnableOption "Enable waybar" // {
          default = cfg.gui.enable;
        };
      };

      browsers = {
        chromium = {
          enable = mkEnableOption "Chromium browser";
          ungoogled = mkEnableOption "Enable ungoogled-chromium Tweaks";
        };

        firefox = {
          enable = mkEnableOption "Firefox browser" // {
            default = cfg.gui.enable;
          };
          schizofox = mkEnableOption "Enable Schizofox Firefox Tweaks" // {
            default = true;
          };
        };
      };

      terminals = {
        wezterm.enable = mkEnableOption "WezTerm terminal emulator";
        ghostty.enable = mkEnableOption "Ghostty terminal emulator";
        kitty.enable = mkEnableOption "Kitty terminal emulator";
        alacritty.enable = mkEnableOption "Alacritty terminal emulator";
        foot.enable = mkEnableOption "Foot terminal emulator" // {
          default = cfg.gui.enable;
        };
      };

      fileManagers = {
        thunar.enable = mkEnableOption "Enable thunar file manager";
        dolphin.enable = mkEnableOption "Enable dolphin file manager";
        nemo.enable = mkEnableOption "Enable nemo file manager";
        nautilus.enable = mkEnableOption "Enable nautilus file manager" // {
          default = cfg.gui.enable;
        };
      };
    };
  };
}
