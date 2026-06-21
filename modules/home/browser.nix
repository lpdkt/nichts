{ pkgs, config, ... }:
{
  programs.firefox = {
    enable = true;
    configPath = "${config.xdg.configHome}/mozilla/firefox";
    policies = {
      DownloadDirectory = "\${home}/downloads";
      OfferToSaveLogins = false;
      PromptForDownloadLocation = true;
      DisplayBookmarksToolbar = "never";
      TranslateEnabled = false;
    };
  };

  home.packages = with pkgs; [ ungoogled-chromium ];
}
