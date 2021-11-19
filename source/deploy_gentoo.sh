#!/bin/bash
# script assumes you already ran emerge --sync
cp -r ./source/portage/* /etc/portage/
mkdir -w /etc/gtk-3.0/
emerge layman cpuid2cpuflags gentoo-sources
layman -S
layman -a guru
layman -a steam-overlay
emerge --update --deep --newuse @world

cp config/settings.ini /etc/gtk-3.0/
cd ./source/suckless
cp patches/default-256.lua /usr/share/vis/themes
sh -c "patch dwm/config.h patches/dwm_patch && cd dwm && make install"
sh -c "patch slstatus/config.h patches/slstatus_patch && cd slstatus && make install"
sh -c "cd st && make install"

emerge --depclean
emerge nvidia-drivers
