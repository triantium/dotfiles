#!/usr/bin/env bash


NOTE="[Note] -> "

echo $NOTE"Disable Read-Only"
sudo steamos-readonly disable

echo $NOTE"Initialize the pacman keyring"
sudo pacman-key --init

echo $NOTE"Populate the pacman keyring"
sudo pacman-key --populate archlinux holo

echo $NOTE"Installing the Software Specified"
sudo pacman -S $1

echo $NOTE"Making Steam OS Read-Only"
sudo steamos-readonly enable

echo $NOTE"You May Close the Terminal Now."
