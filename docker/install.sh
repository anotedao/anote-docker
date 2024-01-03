#!/bin/bash

# Wait for apt to finish
while fuser /var/lib/apt/lists/lock >/dev/null 2>&1 ; do
echo "Waiting for other apt-get instances to exit"
# Sleep to avoid pegging a CPU core while polling this lock
sleep 10
done

# Wait for initial droplet setup to finish
sleep 20

# Update, upgrade and install dependencies
export DEBIAN_FRONTEND=noninteractive
apt update
apt upgrade -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" --force-yes
apt install -y tmux htop vim

# Install Anote node
./anote-node -init
source ./secrets
sed -i "s/D5u2FjJFcdit5di1fYy658ufnuzPULXRYG1YNVq68AH5/$ENCODED/g" /etc/waves/waves.conf
sed -i "s/DTMZNMkjDzCwxNE1QLomcp5sXEQ9A3Mdb2RziN41BrYA/$KEYENCODED/g" /etc/waves/waves.conf
sed -i "s/127.0.0.1:/$PUBLICIP:/g" /etc/waves/waves.conf

# Remove extra files and folders
rm -rf /var/lib/anote/wallet

echo "anonnode" > /etc/hostname