{ config, pkgs, ... }: {
  fileSystems."/moss" = {
    device = "s4743699@moss.labs.eait.uq.edu.au:/home/students/s4743699";
    fsType = "sshfs";
    options = [
      "nodev"
      "noatime"
      "allow_other"
      "IdentityFile=/home/jamesa/.ssh/id_ed25519"
    ];
  };
}
