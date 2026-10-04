{ ... }:
{
  services.fail2ban = {
    enable = true;
    maxretry = 5;
    bantime = "1h";
    bantime-increment = {
      enable = true;
      maxtime = "168h";
    };
    ignoreIP = [
      "127.0.0.1/8"
      "192.168.0.0/16"
      "100.64.0.0/10" # tailscale
    ];
  };

  security.auditd.enable = true;
  security.audit = {
    enable = true;
    rules = [
      "-w /etc/ssh/sshd_config -p wa -k sshd"
      "-w /etc/sudoers -p wa -k sudoers"
      "-a always,exit -F arch=b64 -S execve -F euid=0 -F auid>=1000 -F auid!=-1 -k root_exec"
    ];
  };

  boot.kernel.sysctl = {
    "kernel.kptr_restrict" = 2;
    "kernel.dmesg_restrict" = 1;
    "kernel.unprivileged_bpf_disabled" = 1;
    "net.core.bpf_jit_harden" = 2;
    "net.ipv4.conf.all.accept_redirects" = 0;
    "net.ipv4.conf.default.accept_redirects" = 0;
    "net.ipv4.conf.all.send_redirects" = 0;
    "net.ipv4.conf.all.accept_source_route" = 0;
    "net.ipv6.conf.all.accept_redirects" = 0;
    "net.ipv4.icmp_echo_ignore_broadcasts" = 1;
    "net.ipv4.tcp_syncookies" = 1;
    "fs.protected_hardlinks" = 1;
    "fs.protected_symlinks" = 1;
  };
}
