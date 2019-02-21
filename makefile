build:
	docker build --no-cache --rm -t miiton/asciidoctor-jp .
pdf:
	docker run -it -v `pwd`:/documents/ miiton/asciidoctor-jp asciidoctor-pdf \
		-r asciidoctor-diagram -r /documents/config.rb \
		-D /documents/dist/ -a imagesoutdir=/documents/src/ \
		-a pdf-style=/documents/theme.yml \
		 /documents/src/index.adoc

html:
	docker run -it -v `pwd`:/documents/ miiton/asciidoctor-jp asciidoctor \
		-r asciidoctor-diagram \
		-D /documents/dist/ \
		-a pdf-style=/documents/theme.yml \
		 /documents/src/index.adoc
