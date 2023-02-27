all: render

SHELL = /bin/bash

upload: render
	rsync -a -v --progress --rsh=ssh anchors.js tech-diary.xhtml \
		web-devel-has-become-too-hard.xhtml lost-souls-of-freenode.xhtml \
		why-email-is-not-only-a-todo-list.xhtml \
		cython-report-and-tips.xhtml \
		dest/ssgen.xhtml \
	    "$${__HOMEPAGE_REMOTE_PATH}"/_automated-testing/

TECH_TIPS_OUT = temp/tech-tips-out.xhtml

test: all
	prove Tests/*.t

check: test

docbook5:
	asciidoctor -b docbook5 ./multiverse-cosmology-v0.4.x.asciidoc -o multiverse-cosmology-v0.4.x.db5.xml

README.asciidoc: what-you-should-know-about-automated-testing.docbook5.xml
	perl render.pl
	git add $@
	git add -u .

what-you-should-know-about-automated-testing/all-in-one.xhtml.temp.xml.xhtml: what-you-should-know-about-automated-testing.docbook5.xml
	docmake -v --stringparam "docbook.css.source=" --stringparam "root.filename=all-in-one.xhtml.temp.xml" --basepath /usr/share/sgml/docbook/xsl-ns-stylesheets -x "$${homepage:-$$HOME/Docs/homepage/homepage/trunk/}"/lib/sgml/shlomif-docbook/xsl-5-stylesheets/shlomif-essays-5-xhtml-onechunk.xsl -o what-you-should-know-about-automated-testing/ xhtml5 $<
	perl -0777 -p -i -E 's=<footer/>(</body></html>)\z=$$1=' $@

what-you-should-know-about-automated-testing.docbook5.xml: what-you-should-know-about-automated-testing.docbook5.xml.tt2
	tpage $< > $@

# render: multiverse-cosmology-v0.4.x.asciidoc
render: README.asciidoc
render: what-you-should-know-about-automated-testing/all-in-one.xhtml.temp.xml.xhtml

