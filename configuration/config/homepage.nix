{
  services.homepage-dashboard = {
    enable = true;
    openFirewall = false;

    # Consider a tailscale widget.
    # See https://gethomepage.dev/latest/widgets/services/tailscale/

    settings = {
      quicklaunch = {
        # searchDescriptions = false;
        hideInternetSearch = false;
        showSearchSuggestions = true;
        hideVisitURL = false;
        provider = "duckduckgo";
      };
    };

    widgets = {
      search = {
        provider = "duckduckgo";
        target = "_blank";
        focus = "true";
        showSearchSuggestions = true;
      };
    };

    bookmarks = [
      {
        Developer = [
          {
            GitHub = [
              { abbr = "GH"; href="https://github.com"; }
            ];
          }
          {
            Tailscale = [
              { abbr = "TS"; href = "https://login.tailscale.com/admin"; description = "Tailscale"; }
            ];
          }
          {
            homepage = [
              { abbr = "HD"; href = "https://gethomepage.dev/main/configs/"; description = "homepage-dashboard documentation"; }
            ];
          }
        ];
      }
      {
        Nix = [
          {
            NixOS = [
              { abbr = "NM"; href = "https://nixos.org/manual/nixos/stable/"; description = "NixOS documentation";}
            ];
          }
          {
            Nixpkgs = [
              { abbr = "PK"; href = "https://nixos.org/manual/nixpkgs/stable/"; description = "Nixpkgs documentation"; }
            ];
          }
          {
            Nix = [
              { abbr = "PK"; href = "https://nixos.org/manual/nix/stable"; description = "Nix documentation"; }
            ];
          }
          {
            repo = [
              { abbr = "GR"; href = "https://github.com/NixOS/nixpkgs"; description = "Nixpkgs git repository"; }
            ];
          }
          {
            reproducibility = [
              { abbr = "RP"; href = "https://reproducible.nixos.org/nixos-iso-gnome-r13y/"; description = "Reproducibility Report"; }
            ];
          }
        ];
      }
    ];
  };
}
