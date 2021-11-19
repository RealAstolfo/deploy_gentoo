#!/bin/bash
emerge --sync
emerge --update --deep --newuse @world
emerge layman cpuid2cpuflags
layman -a guru
layman -a steam-overlay

cp -r ./source/portage/* /etc/portage/
cd ./source/suckless
cp patches/default-256.lua /usr/share/vis/themes
sh -c "patch dwm/config.h patches/dwm_patch && cd dwm && make install"
sh -c "patch slstatus/config.h patches/slstatus_patch && cd slstatus && make install"
sh -c "cd st && make install"
