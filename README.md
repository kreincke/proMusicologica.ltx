<!--
% This file is part of proMusicologica.ltx
% (c) 2022 Karsten Reincke (https://github.com/kreincke/proMusicologica.ltx)
% It is distributed under the terms of the creative commons license
% CC-BY-4.0 (= https://creativecommons.org/licenses/by/4.0/)
-->

<p align="center">
    <a href="https://github.com/kreincke/proMusicologica.ltx/commits/" title="Last Commit"><img src="https://img.shields.io/github/last-commit/kreincke/proMusicologica.ltx?style=flat"></a>
    <a href="https://github.com/kreincke/proMusicologica.ltx/issues" title="Open Issues"><img src="https://img.shields.io/github/issues/kreincke/proMusicologica.ltx?style=flat"></a>
    <a href="https://github.com/kreincke/proMusicologica.ltx/blob/master/LICENSE" title="License"><img src="https://img.shields.io/badge/License-CC_BY_4.0-blue.svg?style=flat"></a>
</p>

<p align="center">
  <a href="#use">Use</a>  
  <a href="#structure">Structure</a>  
  <a href="#prerequisites">Prerequisites</a>  
  <a href="#documentation">Documentation</a>  
  <a href="#contributions">Contributors</a>  
  <a href="#licensing">Licensing</a>
</p>

***proMusicologica.ltx*** offers a set of configuration- and template-files that allow scholars to do icological research work on the base of *LaTeX*, *BibLaTeX*, *Biber*, *Jabref* and *Lilypond*. The visible result of these tools, the respective configuration files and content files follow the style of (German) classical philology, German studies and (German) history. In addition to what these disciplines require, musicology needs the possibility, to integrate sheet music samples and music symbols into its scientific texts. Offering that is the main task of *proMusicologica.ltx*.

## Getting you own usable project directory

For setting up ***proMusicologica.ltx*** successfully:

1. Clone the ***proMusicologica.ltx*** repository `git clone https://github.com/kreincke/proMusicologica.ltx` (or download and extract the respective tarball)
2. Open a shell, change into the ***proMusicologica.ltx*** directory and
   * Select a project identifier *YOURPRJ* that does not contain blanks or slashes
   * execute `chmod 755 bin/collprj.sh`
   * execute `collprj.sh YOURPRJ [de|en]`
   * move the created project directory to any other working place
3. change into the created project directory
4. call`make`to verify that the system is running
5. open and close you *JabRef* version once.
6. call `find $HOME -type f | grep jabref | grep customizedBiblatexTypes` to determine, where your *JabRef* configuration files are stored
7. copy `cfg/jabref-prefs.xml` to `$HOME/.java/.userPrefs/org/jabref/prefs.xml` (or wherever your systems stores the general JabRef configurations)
8. copy `cfg/jabref-customizedBibLatexTypes-prefs.xml` to `$HOME/.java/.userPrefs/org/jabref/customizedBiblatexTypes/prefs.xml` (or wherever your systems stores the BibLatex literature specifications)


## Using you own project directory

1. change into the created project directory
2. Do your library work
   * Edit / update the file *tools/search.tex* in accordance with your needs.
   * `cd tools && make search.pdf`
   * Do your library research work as you planned it in *tools/search.tex*
   * Incorporate the bibliographic data into *bib/lit.main.bib* by using *jabref* or any other text editor
   * In case you evaluate a web (html) document download the document (site, pages) as pdf file(s) and store them under *references/BIBTEXKEY.pdf*
   * copy `extracts/extract.md` to `extract/BIBTEXKEY.md`
   * read and excerpt/extract the secondary literature in the respective file
3. Do your writing work
   * edit / update your frame tex file `source/pmArticle-[de|en].tex` respectively `source/pmBook-[de|en].tex`
   * create your snippets by copying *snippets/inc.snippet.tex* to *snippets/inc.YOURCHOICE.tex* and edit the files
   * integrate the snippets by using the LaTeX command `\input{snippets/inc.YOURCHOICE.tex}`
   * Open a shell and type `make help` to get the commands you can use to compile your scientific work as PDF file.
   * Type `make YOURCOMMAND` to really get the human readable version of your scientific work.

If you want to rename the frame, also update the Makefile.

## Structure

Particularly, ***proMusicologica.ltx*** contains files
* to configure LaTeX and Biber in accordance with the style of the classical philology
  - `cfg/inc.cfg-biber-de.tex`
  - `cfg/inc.cfg-biber-en.tex`
* to configure jabref (5.x) in accordance with the classical philology
  - `jabref-prefs.xml`
  - `jabref-customizedBibLatexTypes-prefs.xml`
  - `biber-jabref-types.md`
* to integrate an index of abbreviations
  - `cfg/inc.cfg-ncl-de.tex`
  - `cfg/inc.cfg-ncl-en.tex`
  - `cfg/nomencl.ist`
* to overwrite automatically applied hyphenations
  - `cfg/inc.babelhyphenations.tex`

Additionally, ***proMusicologica.ltx*** contains tools to support the process of doing the humanities research work:
* `tools/search.tex` manage search words and tables for documenting the search in libraries
* `tools/verify.tex` allows to verify one set the bibliographic data in different quotation contexts.
* `tools/demo.tex` takes the abstract bibliographic data (*bib/lit.demo.bib*) and creates a file that showcases all aspects of the (German) classical scholar style.

Finally, ***proMusicologica.ltx*** contains
* `bib/lit.main.bib` (= stores the bibliographic data of the secondary literature, can be edited by a respectively configured *jabref* or a plain text editor, is integrated into the final text by the command LaTeX-command `\addbibresource`)
* `bib/lit.demo.bib` (= store the bibliographic data of abstract secondary literature, can be used for learning the type fields, is used by *demo-de.tex* and  *demo-en.tex* for showcasing all aspects of the (German) classical philology style)
* `bib/lit.verify.bib` (= contains two entries, is used by *verify-de.tex* and  *verify-en.tex* for creating verification contexts)
* `bib/ncl.abbreviations-de.tex` respectively `bib/ncl.abbreviations-en.tex` (= stores general abbreviations, can be edited by any text editor, is added by the LaTeX command `\input{bib/ncl.abbreviations-[de|en].tex}`
)
* `bib/ncl.journals.tex`(= stores journal specific abbreviations, can be edited by any text editor, is added by the LaTeX command `\input{bib/ncl.journals.tex}`
* `snippet/inc.snippet-tpl.tex` (= a template for snippets that can be included into the main work)
* `extracts/extract.md` (= a template in markdown format for excerpting secondary literature that has already been made known to `bib/literature.bib`   )

## Prerequisites

*proMusicologica.ltx* requires the installation of

* a LaTeX distribution with different packages / programs which should be part of your TeX-Distribution:
  * BibLatex : [https://ctan.org/pkg/biblatex](https://ctan.org/pkg/biblatex)
  * Biber : [https://github.com/plk/biber](https://github.com/plk/biber)
  * biblatex-dw [https://ctan.org/pkg/biblatex-dw](https://ctan.org/pkg/biblatex-dw)
  * Koma-Script : [https://www.ctan.org/pkg/koma-script](https://www.ctan.org/pkg/koma-script)
* bash
* make

## Documentation

We decided to apply _English_ as the primary project language although the intended users (= classical scholars) will probably come from German rather than form English speaking countries. There is no designated documentation other than this README.

## Contributions

Contributions to *proMusicologica.ltx* are welcome. Please use the methods of GitHub to do so. But your contributions also have to be licensed under the *CC BY 4.0*.

## Licensing

Copyright (c) 2022 Karsten Reincke

*proMusicologica.ltx* is distributed under the terms of the [**CC BY 4.0**](https://creativecommons.org/licenses/by/4.0/) license; you may not use this project except in compliance with that license. You are free to ...

* share (= copy and redistribute the material in any medium or format)
* adapt (= remix, transform, and build upon the material
    for any purpose, even commercially).

*proMusicologica.ltx* under the following terms:

* You must give appropriate credit, provide a link to the license, and indicate if changes were made. You may do so in any reasonable manner, but not in any way that suggests the licensor endorses you or your use.

* You may not apply legal terms or technological measures that legally restrict others from doing anything the license permits (= *No additional restrictions*)

### Clarifications

*proMusicologica.ltx* is a set of template files and intended to be instantiated and reused in the users own scientific work. Therefore we decide:

1. Instantiating *proMusicologica.ltx* files and reusing them in one's own (scientific) writing project does not make this writing project a derivative work of *proMusicologica.ltx* (hence: you do not have to mark your modifications in your project directory)  
2. But if you distribute a modified version of *proMusicologica.ltx* as a non-instantiated set of templates (as you've got it), you must mark your modifications  
3. The requirement *to give appropriate credit and provide a link to the license* can be fulfilled by adding a note to your work like this:
  * Erstellt  auf der Basis des CC-BY-4.0 lizenzierten Tools **proMusicologica** von K. Reincke © 2022 Repository: [https://github.com/kreincke/proMusicologica.ltx](https://github.com/kreincke/proMusicologica.ltx),
Lizenztext [https://creativecommons.org/licenses/by/4.0/](https://creativecommons.org/licenses/by/4.0/)
  * Developed on the base of the CC-BY-4.0 licensed tool **proMusicologica.ltx** by K. Reincke  © 2022 2022 [
repository = [https://github.com/kreincke/proMusicologica.ltx](https://github.com/kreincke/proMusicologica.ltx),
license text = [https://creativecommons.org/licenses/by/4.0/](https://creativecommons.org/licenses/by/4.0/) ]
