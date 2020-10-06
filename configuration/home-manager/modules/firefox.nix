{ pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    package = pkgs.firefox;
    extensions = with pkgs.nur.repos.rycee.firefox-addons; [
      vimium
      umatrix
      ublock-origin
      browserpass

      # Zhongwen Chinese Popup Dictionary
    ];

    profiles = let
      commonSettings = {
        # Privacy
        "privacy.trackingprotection.enabled" = true;

        # Region
        "general.useragent.locale" = "en-GB";
        "distribution.searchplugins.defaultLocale" = "en-GB";
        "browser.search.region" = "GB";
        "browser.search.countryCode" = "GB";

        # Turn annoying stuff off
        "app.update.auto" = false;
        "signon.rememberSignons" = false;

        # Clean up empty tab
        "browser.newtabpage.activity-stream.feeds.section.highlights" = false;
        "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
        "browser.newtabpage.activity-stream.feeds.snippets" = false;
        "browser.newtabpage.activity-stream.feeds.topsites" = false;

        # TODO: use Duckduckgo as default search engine
      };
    in {
      personal = {
        id = 0;
        settings = commonSettings;
      };

      #work = {
      #id = 1;
      #};
    };
  };
}
