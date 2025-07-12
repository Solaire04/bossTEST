#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "Must run this as root. Try \"sudo ./install.sh\""
  exit
fi

PREFIX=/usr/local

install -v -m755 boss ${PREFIX}/bin
install -v -m644 boss.desktop ${PREFIX}/share/applications
install -v -m644 boss.svg ${PREFIX}/share/icons/hicolor/scalable/apps/

echo "Installing icons into ${PREFIX}/share/icons/hicolor/\*/apps"

for d in ${PREFIX}/share/icons/hicolor/*x*
do
   res=`basename $d`
   convert -resize $res boss.svg $d/apps/boss.png
done
