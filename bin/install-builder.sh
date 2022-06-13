#!/bin/bash

set -e


echo "APT::Install-Recommends \"false\";" | tee -a /etc/apt/apt.conf.d/99buildpack.conf
echo "APT::Get::Upgrade \"false\";" | tee -a /etc/apt/apt.conf.d/99buildpack.conf
echo "APT::Get::Install-Suggests \"false\";" | tee -a /etc/apt/apt.conf.d/99buildpack.conf

if [[ -n "${APT_PROXY}" ]]; then
  echo "Acquire::http::proxy \"${APT_PROXY}\";" | tee -a /etc/apt/apt.conf.d/99buildpack-proxy.conf
fi

export DEBIAN_FRONTEND=noninteractive

apt-get update -q
apt-get install -q -y \
  build-essential \
  ca-certificates \
  curl \
  dumb-init \
  git \
  libssl-dev \
  libreadline-dev \
  zlib1g-dev \
  ;

git clone https://github.com/rbenv/ruby-build.git
PREFIX=/usr/local ./ruby-build/install.sh

mkdir -p /usr/local/ruby /cache

#--------------------------------
# cleanup
#--------------------------------
if [[ -n "${APT_PROXY}" ]]; then
  rm -f /etc/apt/apt.conf.d/99buildpack-proxy.conf
fi
