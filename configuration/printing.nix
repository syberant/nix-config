{ pkgs, ... }:

{
  services.printing = {
    enable = true;
    drivers = with pkgs; [
      # Contains many drivers
      gutenprintBin
      gutenprint

      # Drivers for the LBP612C/613C
      canon-cups-ufr2
    ];
  };
}
