{ nixpkgs-git, ... }:

{
  environment.systemPackages = with nixpkgs-git; [
    tor-browser
    discord
    yt-dlp
  ];
}
