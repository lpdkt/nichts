{ pkgs, ... }:
{
  programs.firefox = {
    enable = true;
    policies = {
      DownloadDirectory = "\${home}/downloads";
      OfferToSaveLogins = false;
      PromptForDownloadLocation = true;
      DisplayBookmarksToolbar = "never";
      TranslateEnabled = false;
    };
  };

  home.packages = with pkgs; [
    ungoogled-chromium
    tor-browser
  ];
}
