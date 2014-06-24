# README.md #

## Bootstraping networking ##

Before we can run the OpenStack playbook on the nodes, we must prepare the networking on the nodes.

A few minimal manual steps has to be done before bootstraping the networking in the machines:

1. Ensure eth0 comes up; i.e.

    `echo '' > /lib/udev/rules.d/75-persistent-net-generator.rules`
    
    `echo '' > /etc/udev/rules.d/70-persistent-net.rules`

1. Disable SELINUX; i.e. `sed -ie 's/^SELINUX=.*/SELINUX=disabled/' /etc/selinux/config`
1. Disable firewall; i.e. `chkconfig iptables off; chkconfig ip6tables off`
1. root is able to ssh using a private key; i.e. the public key is added to `/root/.ssh/authorized_keys`

Once the machines are ready and running, **edit the `bootstrap-network-inventory.ini` file and update the current DHCP-assigned IPs**. This allows the bootstrap-network.yml playbook to hit each box and configure the network automatically for you.

`% ansible-playbook -i bootstrap-network-inventory.ini bootstrap-network.yml`

## Few other things ##

* `% yum install -y libselinux-python`

## Running the OpenStack playbook ##

Before running the playbook, copy the `passwords.yml.template` file to `passwords.yml` and update the passwords and other information in that file.

To run the playbook, run the following command:
```
  % ansible-playbook -i open-stack-inventory.ini open-stack-playbook.yml --extra-vars @passwords.yml --ask-vault-pass
```
