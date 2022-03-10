#!/bin/bash

# This file is part of proMusicologica.ltx
# (c) 2022 Karsten Reincke (https://github.com/kreincke/proMusicologica.ltx)
# It is distributed under the terms of the creative commons license
# CC-BY-4.0 (= https://creativecommons.org/licenses/by/4.0/)


DE="de"
EN="en"
LANG=${DE}

function mhelp {
 echo "collprj.sh [en|de] PRJ";
 exit 0;
}

if [ "$2" == "" ]; then mhelp; fi;

PID=$2

if [ "$1" == "${EN}" ] ||[ "$1" == "EN" ] ; then
  LANG="${EN}";
elif [ "$1" == "${DE}" ] ||[ "$1" == "DE" ] ; then
  LANG="${DE}";
else
  mhelp;
fi

echo "collecting files for project $PID in language $LANG"

if [ -d ${PID} ]; then rm -rf ${PID}; fi

mkdir -p ${PID}/references

cp -rd README.md extracts source tools ${PID}
if [ "${LANG}" == "${EN}" ] ; then
  find ${PID} -name "*-de.tex" | while read f; do rm $f; done
  cp sys/Makefile.en ${PID}/Makefile
else
  find ${PID} -name "*-en.tex" | while read f; do rm $f; done
  cp sys/Makefile.de ${PID}/Makefile
fi;

exit 0;
