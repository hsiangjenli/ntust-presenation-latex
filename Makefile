author := hsiangjenli
tag := ntust-thesis-v1.8.1
image := $(author)/xelatex:$(tag)

image:
	docker build -t $(image) .github

exec:
	docker run -it --rm -v "$(PWD):/workspace" $(image) /bin/bash

compile:
	xelatex -interaction nonstopmode --output-directory=build main.tex
	
pdf:
	mkdir -p build
	make -i compile
	bibtex build/main.aux
	xelatex --output-directory=build main.tex
	xelatex --output-directory=build main.tex
