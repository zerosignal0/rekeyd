#!/bin/bash
set -eux

sudo $GOPATH/bin/vault server -dev -config $TRAVIS_BUILD_DIR/ci/conf/vault_conf.hcl &

if [ ! -f $HOME/.vault-token ]; then
  echo Waiting for Vault to start
  sleep 5

  if [ ! -f $HOME/.vault-token ]; then
    echo "Unable to detect $HOME/.vault-token"
    exit 1
  fi
fi

if ! curl "http://127.0.0.1:9200/v1/sys/init"; then
  echo "Unable to query vault API for sys/init, exiting."
  exit 1
fi

