author := hsiangjenli
tag := ntust-thesis-v1.8.1
image := $(author)/xelatex:$(tag)

image:
	docker build -t $(image) .github

exec:
	docker run -it --rm -v "$(PWD):/workspace" $(image) /bin/bash

pdf:
	mkdir -p build
	xelatex -interaction nonstopmode --output-directory=build main.tex
	xelatex -interaction nonstopmode --output-directory=build main.tex
	bibtex build/main.aux
	rm -rf  out
	xelatex -interaction nonstopmode --output-directory=build main.tex
	xelatex -interaction nonstopmode --output-directory=build main.tex
