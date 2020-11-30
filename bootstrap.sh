#! /bin/bash

# ---------------------------------------------------
# UPDATING HOST FILE
# ---------------------------------------------------
echo "EXECUTING STEP 1 --> /etc/hosts FILE UPDATION"
cat >>/etc/hosts<<EOF
172.16.1.101 minion1.example.com minion1
EOF

mkdir -p docker-workspace

# ---------------------------------------------------
# ADDING PACKAGES, REPOSITORY TO INSTALL DOCKER
# ---------------------------------------------------
echo "EXECUTING STEP 2 --> DOCKER INSTALLATION (WAIT FOR FEW MINUTES)"

# UPDATE THE PACKAGE MANAGER AND INSTALL NECESSARY PACKAGES
apt-get update -y -qq && apt-get install -y -qq apt-transport-https ca-certificates curl software-properties-common >/dev/null 2>&1

# ADD DOCKER'S OFFICIAL GPG KEYS
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

# ADD DOCKER REPOSITORY
add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) \
  stable"

# INSTALL DOCKER CE
apt-get update -y -qq && apt-get install -y -qq containerd.io docker-ce docker-ce-cli >/dev/null 2>&1 

# RESTART DOCKER
systemctl enable docker

# RUNNING DOCKER WITHOUT SUDO
usermod -aG docker vagrant
