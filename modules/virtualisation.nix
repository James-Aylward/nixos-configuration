{ config, pkgs, ... }: {
  virtualisation.virtualbox.host.enable = true;
  #users.extraGroups.vboxusers.members = [ "jamesa" ];
  virtualisation.libvirtd.enable = true;
  virtualisation.virtualbox.host.enableKvm = true;
  virtualisation.virtualbox.host.addNetworkInterface = false;
}
