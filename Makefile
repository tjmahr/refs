

generate.html : generate.md wisclab.bib
	pandoc generate.md --from markdown+smart --to html --output generate.html --standalone --filter pandoc-citeproc
