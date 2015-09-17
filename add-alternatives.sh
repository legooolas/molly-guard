#!/bin/bash

# Before we clobber anything, copy the files (which exist) to /lib/molly-guard:
for file in /sbin/poweroff /sbin/reboot /sbin/shutdown /sbin/coldreboot /sbin/pm-hibernate /sbin/pm-suspend /sbin/pm-suspend/hybrid ; do
  cp -av "${file}" /lib/molly-guard/
done

# TODO : What to do with the /usr/bin versions?  Currently we just replace them with molly-guard versions.


alternatives --install /sbin/halt halt              /lib/molly-guard/molly-guard 999 \
  --slave /sbin/poweroff          poweroff          /lib/molly-guard/molly-guard \
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

