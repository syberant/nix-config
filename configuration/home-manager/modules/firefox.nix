{ pkgs, lib, ... }:

{
  programs.browserpass.enable = true;

  programs.firefox = {
    enable = true;
    package = pkgs.firefox;
    extensions = with pkgs.nur.repos.rycee.firefox-addons; [
      vimium
      umatrix
      ublock-origin

      # Zhongwen Chinese Popup Dictionary
      (buildFirefoxXpiAddon {
        pname = "zhongwen";
        version = "5.10.0";

        addonId = "{dedb3663-6f13-4c6c-bf0f-5bd111cb2c79}";
        url = "https://addons.mozilla.org/firefox/downloads/file/3701579/zhongwen_the_popular_chinese_learning_tool-5.10.0-an+fx.xpi";
        sha256 = "Rfn0rs/9jhyjYh8mvggyodsK0APdYATZmf5C5lJh6ow=";

        meta = with lib; {
          homepage = "https://github.com/cschiller/zhongwen";
          description = "Official Firefox port of the Zhongwen Chrome extension. Chinese-English dictionary and learning tool.";
          license = licenses.gpl2;
          platforms = platforms.all;
        };
      })
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
