#!/usr/bin/env -S sudo fish

apt update && apt distupgrade -y && apt autoremove && systemctl poweroff -i
