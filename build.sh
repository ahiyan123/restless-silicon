#!/bin/bash
set -e
echo "[*] Cloning Buildroot Environment..."
git clone git://git.buildroot.net/buildroot --depth=1
cd buildroot

# Copy Pioneer logic into the Buildroot tree
cp -r ../board .
cp ../configs/sovereign_defconfig configs/

# Compile the OS
echo "[*] Starting Compilation (This will take time)..."
make sovereign_defconfig
make -j$(nproc)

echo "[!] Success! Flash 'output/images/sdcard.img' to your microSD."
