{ ... }:

{
  home-manager.users.sybrand.programs.ssh = {
    enable = true;

    matchBlocks."lilo.science.ru.nl" = {
      user = "sybrandaarnoutse";
      hostname = "lilo.science.ru.nl";
    };
  };
}
