# Use Pandoc to build the markdown into a website
#
# Author: Patrick Dougherty
# Date: July 19, 2017
#
# Use "make" or "make html" to build the website
#
# Use "clean" to remove all html

# Pandoc
PANDOC=/usr/bin/pandoc
PANDOC_OPTIONS=-f markdown+smart
PANDOC_HTML_OPTIONS=--to html5 --template=template.html

# Files
SRC := $(wildcard src/*.md)
DST = $(SRC:src/%.md=%.html)

.PHONY: html clean show

html: $(DST) site.mini.css

site.mini.css: site.css
	hasmin -t site.css > site.mini.css

# Pattern matching
%.html: src/%.md template.html
	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_HTML_OPTIONS) -o $@ $<

clean:
	rm $(DST) site.mini.css

# Debugging
show:
	@echo '$(VALUE)="$($(VALUE))"'
