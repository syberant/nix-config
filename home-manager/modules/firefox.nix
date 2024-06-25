{ pkgs, lib, ... }:

# TODO: Have a look at
# - https://addons.mozilla.org/en-US/firefox/addon/tabby-window-tab-manager/
# - https://addons.mozilla.org/en-US/firefox/addon/enhancer-for-youtube/

{
  programs.browserpass.enable = true;

  programs.firefox = {
    enable = true;
    package = pkgs.firefox.override {
      # Disables speechd support.
      # Reduces closure size, amount of running processes and attack surface
      cfg.speechSynthesisSupport = false;
    };

    # Stolen from: https://discourse.nixos.org/t/declare-firefox-extensions-and-settings/36265
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      DisablePocket = true;
      DisableFirefoxAccounts = true;
      DisableAccounts = true;
    };

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

        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          vimium
          umatrix
          ublock-origin

          # Zhongwen Chinese Popup Dictionary
          (buildFirefoxXpiAddon {
            pname = "zhongwen";
            version = "5.10.0";

            addonId = "{dedb3663-6f13-4c6c-bf0f-5bd111cb2c79}";
            url =
              "https://addons.mozilla.org/firefox/downloads/file/3701579/zhongwen_the_popular_chinese_learning_tool-5.10.0-an+fx.xpi";
            sha256 = "Rfn0rs/9jhyjYh8mvggyodsK0APdYATZmf5C5lJh6ow=";

            meta = with lib; {
              homepage = "https://github.com/cschiller/zhongwen";
              description =
                "Official Firefox port of the Zhongwen Chrome extension. Chinese-English dictionary and learning tool.";
              license = licenses.gpl2;
              platforms = platforms.all;
            };
          })
        ];

      };

      focus = {
        id = 2;
        settings = commonSettings // {
          "browser.privatebrowsing.autostart" = true;
        };
        userChrome = ''
          /* Remove tab bar */
          #tabbrowser-tabs { visibility: collapse !important; }
        '';
      };

      #work = {
      #id = 1;
      #};
    };
  };
}
