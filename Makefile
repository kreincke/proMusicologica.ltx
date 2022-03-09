# This file is part of proMusicologica.ltx
# (c) 2022 Karsten Reincke (https://github.com/kreincke/proMusicologica.ltx)
# It is distributed under the terms of the creative commons license
# CC-BY-4.0 (= https://creativecommons.org/licenses/by/4.0/)

PMBD=pmBook-de
PMBE=pmBook-en
PMAD=pmArticle-de
PMAE=pmArticle-en
PMWD=proMusil
SRCD=source
LPWD=lily


define createProMusicologicaFile
  # (1) create a lilypond working directory and call the lilypond pre operations
  @ cp -rd ${SRCD} ${LPWD}
  @ ( cd ${LPWD} && lilypond-book --out ../${PMWD} $1.tex )
  # (2) now lilypond has created & collected all sources it needs into the final working dir
  # but unfortunatelay not all sources. The missed parts must be copied into that dir manually
  # (3) ensure that the dirs exist we need
  @ mkdir -p  ${PMWD}/bib/ ${PMWD}/cfg ${PMWD}/logos
  # (4) ensure that also the missed files can be found in the final working directory
  @ cp -rd ${SRCD}/bib/* ${PMWD}/bib/
  @ cp -rd ${SRCD}/cfg/* ${PMWD}/cfg/
  @ cp -rd ${SRCD}/logos/* ${PMWD}/logos/
  @ cp ${SRCD}/inc.rel.tex ${PMWD}/
  @ cp ${SRCD}/picins.sty ${PMWD}/
  @ cp ${SRCD}/Makefile ${PMWD}/
  ( cd ${PMWD} && make $1.pdf && mv *.pdf ../ )
  rm -rf ${LPWD}
  rm -rf ${PMWD}
endef


bookd:	clear
	$(call createProMusicologicaFile,${PMBD})

booke:	clear
	$(call createProMusicologicaFile,${PMBE})

artld:	clear
	$(call createProMusicologicaFile,${PMAD})

artle:	clear
	$(call createProMusicologicaFile,${PMAE})


clear:
	@if [ -e ${LPWD} ]; then rm -rf ${LPWD}; fi
	@if [ -e ${PMWD} ]; then rm -rf ${PMWD}; fi

clean:  clear
	@(cd source && make clean && make dclean)
	if [ `ls *.pdf | wc -l` != 0  ]; then rm *.pdf; fi
help:
	@echo "make [bookd|booke|artld|artle|help|clean]"
