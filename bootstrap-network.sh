#!/bin/sh
time ansible-playbook -i bootstrap-network-inventory.ini bootstrap-network.yml
