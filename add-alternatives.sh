#!/bin/bash
alternatives --install /sbin/halt halt              /lib/molly-guard/molly-guard 999 \
  --slave /sbin/powreoff          poweroff          /lib/molly-guard/molly-guard \
  --slave /sbin/reboot            reboot            /lib/molly-guard/molly-guard \
  --slave /sbin/shutdown          shutdown          /lib/molly-guard/molly-guard \
  --slave /sbin/coldreboot        coldreboot        /lib/molly-guard/molly-guard \
  --slave /sbin/pm-hibernate      pm-hibernate      /lib/molly-guard/molly-guard \
  --slave /sbin/pm-suspend        pm-suspend        /lib/molly-guard/molly-guard \
  --slave /sbin/pm-suspend-hybrid pm-suspend-hybrid /lib/molly-guard/molly-guard \
\
  --slave /usr/bin/reboot         usrbinreboot      /lib/molly-guard/molly-guard \
  --slave /usr/bin/halt           usrbinhalt        /lib/molly-guard/molly-guard \
  --slave /usr/bin/poweroff       usrbinpoweroff    /lib/molly-guard/molly-guard


# Ensure we're using this one too:
alternatives --set halt /lib/molly-guard/molly-guard

