# This file is part of proMusicologica.ltx
# (c) 2022 Karsten Reincke (https://github.com/kreincke/proMusicologica.ltx)
# It is distributed under the terms of the creative commons license
# CC-BY-4.0 (= https://creativecommons.org/licenses/by/4.0/)


#LATEX=latex
LATEX=pdflatex
# make [ default | all | filename.pdf ]  [ REL=1.2 ]?
REL=""

AUX_EXTS=url bbl blg aux dvi toc log lof nlo nls ilg ils ent out log xml bcf
RES_EXTS=ps pdf

default:  demo-de.pdf

all: aen ade

ade: demo-de.pdf verify-de.pdf search-de.pdf

aen: demo-en.pdf verify-en.pdf search-en.pdf

help:
	echo "make [ default | aen | ade | all | filename.pdf | help ]  [ REL=1.2 ]?"


.SUFFIXES: .tex .dvi .ps .pdf .rtf

.tex.pdf:
	@ echo "### `date +'%Y%m%dT%H%M%S'`"
	@ echo "### converting $< to $@"
	@ $(LATEX) $<
	@ biber `basename $< .tex`
	@ makeindex `basename $< .tex`.nlo -s ../source/cfg/nomencl.ist -o `basename $< .tex`.nls
	@ $(LATEX) $<
	@ $(LATEX) $<
ifneq ($(LATEX),pdflatex)
	@ echo "### converting DVI to PostScript"
	@ dvips $<
	@ echo "### converting PostScript to PDF"
	@ ps2pdf $<
endif
	@ if [ ${REL} != "" ]; then mv $@ `basename $@ .pdf`-${REL}.pdf; fi
	@ make clearAuxFiles

.tex.dvi:
	@ echo "### `date +'%Y%m%dT%H%M%S'`"
	@ echo "### converting $< to $@"
	@ latex $<
	@ biber `basename $< .tex`
	@ makeindex `basename $< .tex`.nlo -s ../source/cfg/nomencl.ist -o `basename $< .tex`.nls
	@ latex $<
	@ latex $<

.dvi.ps:
	@ echo "### `date +'%Y%m%dT%H%M%S'`"
	@ echo "### converting $< to $@"
	@ dvips $<

clearAuxFiles:
	$(foreach EXT, ${AUX_EXTS}, if [ ! "x`ls *.${EXT} 2>/dev/null`" = "x" ]; then rm *.${EXT}; fi;)

clean:	clearAuxFiles
	$(foreach EXT, ${RES_EXTS}, if [ ! "x`ls *.${EXT} 2>/dev/null`" = "x" ]; then rm *.${EXT}; fi;)

clear:	clean
