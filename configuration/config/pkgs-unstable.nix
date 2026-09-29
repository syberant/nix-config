{ nixpkgs-git, ... }:

{
  environment.systemPackages = with nixpkgs-git; [
    tor-browser
    yt-dlp
  ];
}
