{ nixpkgs-git, ... }:

{
  environment.systemPackages = with nixpkgs-git; [
    tor-browser-bundle-bin
    discord
    yt-dlp
  ];
}
