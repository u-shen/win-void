#!/bin/bash
pacman -Syuu && pacman -S \
    base-devel mingw-w64-x86_64-toolchain \
    zip unzip psmisc
