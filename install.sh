#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "Must run this as root. Try \"sudo ./install.sh\""
  exit
fi

PREFIX=/usr/local

## if no directories in the destination location, create at least some
for d in "${PREFIX}/bin ${PREFIX}/share/applications ${PREFIX}/share/icons/hicolor/scalable/apps ${PREFIX}/share/icons/hicolor/16x16/apps ${PREFIX}/share/icons/hicolor/32x32/apps ${PREFIX}/share/icons/hicolor/64x64/apps ${PREFIX}/share/icons/hicolor/128x128/apps ${PREFIX}/share/icons/hicolor/256x256/apps ${PREFIX}/share/icons/hicolor/512x512/apps"
do
  if [ ! -d "$d" ]; then
    mkdir -p $d
  fi
done

install -v -m755 boss ${PREFIX}/bin
install -v -m644 boss.desktop ${PREFIX}/share/applications
install -v -m644 boss.svg ${PREFIX}/share/icons/hicolor/scalable/apps/
install -v -m644 99-zwo.rules /etc/udev/rules.d

echo "Installing icons into ${PREFIX}/share/icons/hicolor/\*/apps"

for d in ${PREFIX}/share/icons/hicolor/*x*
do
   res=`basename $d`
   convert -resize $res boss.svg $d/apps/boss.png
done
