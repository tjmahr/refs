

generate.html : generate.md lwl.bib
	pandoc --filter pandoc-citeproc generate.md -o generate.html --smart --standalone
