# This file is part of proMusicologica.ltx
# (c) 2022 Karsten Reincke (https://github.com/kreincke/proMusicologica.ltx)
# It is distributed under the terms of the creative commons license
# CC-BY-4.0 (= https://creativecommons.org/licenses/by/4.0/)

#LATEX=latex
LATEX=pdflatex

AUX_EXTS=url bbl blg aux dvi toc log lof nlo nls ilg ils ent out log bcf xml
RES_EXTS=ps pdf

SUBDIRS=snippets

REL=inc.rel.tex
WORK=proMusicologica

all:
	make ${WORK}.pdf

.SUFFIXES: .tex .dvi .ps .pdf .rtf

.tex.pdf:
	@ echo "### `date +'%Y%m%dT%H%M%S'`"
	@ echo "### converting $< to $@"
	@ $(LATEX) $<
# (C) creating the help files for the literature
	@ biber `basename $< .tex`
	@ makeindex `basename $< .tex`.nlo -s cfg/nomencl.ist -o `basename $< .tex`.nls
	@ $(LATEX) $<
	@ $(LATEX) $<
ifneq ($(LATEX),pdflatex)
	@ echo "### converting DVI to PostScript"
	@ dvips $<
	@ echo "### converting PostScript to PDF"
	@ ps2pdf $<
endif
	@ mv $@ `basename $@ .pdf`-`cat cfg/inc.rel.tex`.pdf
	@ make clearAuxFiles

.tex.dvi:
	@ echo "### `date +'%Y%m%dT%H%M%S'`"
	@ echo "### converting $< to $@"
	@ latex $<
	@ biber `basename $< .tex`
	@ makeindex `basename $< .tex`.nlo -s cfg/nomencl.ist -o `basename $< .tex`.nls
	@ latex $<
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

dclean:
	echo '#!/bin/bash' > xc.sh
	echo FEXT="\"`echo $(AUX_EXTS) | sed 's/ /|/g'`\"" >> xc.sh
	echo 'find . | egrep "\.($$FEXT)" | while read f; do echo "deleting $$f"; rm $$f; done' >> xc.sh
	chmod 755 xc.sh
	./xc.sh
	rm xc.sh
