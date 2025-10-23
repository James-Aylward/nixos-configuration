{ config, pkgs, ... }:
{

  environment.systemPackages = with pkgs; [ remmina ];

  services.tailscale.enable = true;
  services.tailscale.useRoutingFeatures = "both";
  services.resolved.enable = true;

  networking.firewall = {

    # if packets are still dropped, they will show up in dmesg
    logReversePathDrops = true;

    # wireguard trips rpfilter up
    extraCommands = ''
      ip46tables -t mangle -I nixos-fw-rpfilter -p udp -m udp --sport 1637 -j RETURN
      ip46tables -t mangle -I nixos-fw-rpfilter -p udp -m udp --dport 1637 -j RETURN
    '';
    extraStopCommands = ''
      ip46tables -t mangle -D nixos-fw-rpfilter -p udp -m udp --sport 1637 -j RETURN || true
      ip46tables -t mangle -D nixos-fw-rpfilter -p udp -m udp --dport 1637 -j RETURN || true
    '';

    trustedInterfaces = [ "tailscale0" ];
    allowedUDPPorts = [ 41641 ];
    allowedTCPPorts = [
      9090
      9091
    ];
  };

}
