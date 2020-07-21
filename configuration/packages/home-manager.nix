{ pkgs, ... }:

let
  rev = "4bd0ca2cd793b3f057d114bd6a3183419f52ca49";
  home-manager = builtins.fetchTarball {
    url = "https://github.com/rycee/home-manager/archive/${rev}.tar.gz";
    sha256 = "15sdvnfv4fzjqn2rj4ifavg23h7sinwiqay44lgn9mk8namp91id";
  };
in {
  imports = [ (import "${home-manager}/nixos") ];

  # TODO: use home-manager from nur XOR find out why that isn't possible...
  #imports = [ pkgs.nur.repos.rycee.modules.home-manager ];

  #environment.systemPackages = [ pkgs.firefox ];
  home-manager.users.sybrand.programs.firefox = {
    enable = true;
    package = pkgs.firefox;
    extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        vimium
        umatrix
        ublock-origin
        # browserpass

        # Zhongwen Chinese Popup Dictionary
    ];
  };
  home-manager.users.sybrand.programs.firefox.profiles =
    let commonSettings = {
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
}
