{ pkgs, ... }:

{
  # Delay between suspending to RAM and suspending to disk when using suspend-then-hibernate
  # See: https://wiki.archlinux.org/title/Power_management#Suspend_and_hibernate
  systemd.sleep.extraConfig = ''
    HibernateDelaySec=30m
  '';

  # First suspend and then hibernate when pressing power key
  # services.logind.extraConfig = ''
  #   HandlePowerKey=suspend
  #   HandleSuspendKey=suspend
  # '';

  # Allow wake-on-lan to wake up computer
  networking.interfaces.enp5s0.wakeOnLan.enable = true;
}
