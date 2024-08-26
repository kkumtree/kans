locals {
  user_data_ec21 = <<-EOF
    #!/bin/bash
    hostnamectl --static set-hostname MyServer

    # Config convenience
    echo 'alias vi=vim' >> /etc/profile
    systemctl stop ufw && systemctl disable ufw
    systemctl stop apparmor && systemctl disable apparmor
    ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

    # Install packages
    apt update -qq && apt install tree jq bridge-utils net-tools conntrack gcc make pkg-config libseccomp-dev -y
    EOF
}