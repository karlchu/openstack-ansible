#!/bin/sh
time ansible-playbook -i open-stack-inventory.ini open-stack-playbook.yml --extra-vars @passwords.yml --vault-password-file=password -vv
