{
  xdg = {
    enable = true;

    desktopEntries = {
      focus-browser = {
        name = "Focus Browser";
        categories = [
          "Network"
          "WebBrowser"
        ];
        genericName = "Web Browser";
        mimeType = [ "text/html" ];

        exec = "firefox --private-window %U";
        terminal = false;
      };

      newsboat = {
        name = "Newsboat";
        categories = [
          "Network"
          "Feed"
        ];
        genericName = "Feed Reader";
        mimeType = [ "application/rss+xml" ];

        exec = "newsboat";
        terminal = true;
      };
    };
  };
}
