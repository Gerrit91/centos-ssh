#!/bin/bash
set -e

ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''
ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key -N ''

AUTHORIZED_KEY_PATH=${AUTHORIZED_KEY_PATH:=/authorized_keys}

if [ -f $AUTHORIZED_KEY_PATH ]; then
  SSH_ROOT=/root/.ssh
  mkdir -p $SSH_ROOT
  cp $AUTHORIZED_KEY_PATH $SSH_ROOT
  chown -R root:root $SSH_ROOT
  chmod 0700 $SSH_ROOT
  chmod 0600 $SSH_ROOT/authorized_keys
  echo "using ${AUTHORIZED_KEY_PATH}, starting sshd..."
else
  echo "no authorized_keys found, starting sshd..."
fi

exec /usr/sbin/sshd -D -e "$@"
